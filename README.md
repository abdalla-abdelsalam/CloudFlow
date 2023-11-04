# final-project
## graduation project for ITI journey at devops track :relaxed:

# DevOps tools and cloud provider used:
## 1. Docker Platform
## 2. Kubernetes
## 3. Terraform 
## 5. Jenkins
## 6. Amazon Web Services (AWS)

## What we have done 
1. Created first jenkins pipeline to do:
   - Creat infrastructure on AWS using Terraform.
2. Created second jenkins pipeline to do:
   - Build a simple hello app Dockerfile. 
   - push it to elastic container registry repository (ECR).
   - Deploy our image with kubernetes YAML file to the cluster (EKS).  

## Infrastructure with Terraform
1. VPC with public and private subnets with their configurations
2. Elastic container registry to push the app image 
3. EKS cluster 

-To use this project: fisrt install jenkins on your machine :
 make two pipelines with two Jenkinsfiles then build the first one :relaxed:


