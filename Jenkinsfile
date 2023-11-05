pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
        pipelineEmail = 'testingfeature101@gmail.com'
        AWS_DEFAULT_REGION = "us-east-1"
    }
    parameters {
        booleanParam(
            name: 'DESTROY',
            defaultValue: false,
            description: 'Check to destroy the infrastructure'
        )
    }

    stages {
        stage('Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/abdalla-abdelsalam/CloudFlow'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh "terraform init"
                }
            }
        }
        stage('Terraform Apply') {
            when {
                expression { !params.DESTROY }
            }
            steps {
                script {
                    sh "terraform apply -auto-approve"
                }
            }
        }
        stage('cleanup & Destroy') {
            when {
                expression { params.DESTROY }
            }
            steps {
                script {
                    sh "aws ecr delete-repository --repository-name goviolin --force"
                    sh "aws eks --region us-east-1 update-kubeconfig --name goviolin-eks"
                    sh "kubectl delete -f ./GoViolin/k8s/deployment.yaml"
                    sh "kubectl delete -f ./GoViolin/k8s/service.yaml"
                    sh "terraform destroy -auto-approve"
                }
            }
        }
    }

    post {
        success {
            script {
                if (!params.DESTROY) {
                    echo 'congrats, another successful build !!'
                    mail bcc: '', body: "<b>successful build !! infrastructure is up and running</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> build URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "Project name -> ${env.JOB_NAME}", to: "$pipelineEmail";  
                    build job: 'deployment-pipeline'
                }
            }
        }
        failure {
            echo "Build failed!"
            mail bcc: '', body: "<b>build failed for infrastructure pipeline</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> build URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "$pipelineEmail";
        }
    }
}
