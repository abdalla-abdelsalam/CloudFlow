terraform {
  backend "s3" {
    bucket         = "project-bucket88"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}


