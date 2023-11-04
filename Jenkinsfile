pipeline {
    agent any
        environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
        pipelineEmail = 'testingfeature101@gmail.com'
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
                expression { ! params.DESTROY }
            }
            steps {
                script {
                    sh "terraform apply -auto-approve"
                }
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { params.DESTROY }
            }
            steps {
                script {
                    sh "terraform destroy -auto-approve"
                }
            }
        }

    }
    post {
        success {
            echo 'congrats, another successful build !!'
            mail bcc: '', body: "<b>successful build !! infrastructure is up and running</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> build URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "Project name -> ${env.JOB_NAME}", to: "$pipelineEmail";  
            build job: 'deployment-pipline'
        }
        failure {
            echo "Build failed!"
            mail bcc: '', body: "<b>build failed for infrastucture pipline</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> build URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "$pipelineEmail";
        }
    }
    
}
