# Create an Elastic Container Registry Repository
resource "aws_ecr_repository" "images-Repository" {
  name                 = "images-Repository"
  # allow image tags to be overwritten
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}