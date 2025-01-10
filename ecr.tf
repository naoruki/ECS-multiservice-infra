resource "aws_ecr_repository" "service1" {
  name         = "jaz-service1-ecr"
  force_delete = true
}

resource "aws_ecr_repository" "service2" {
  name         = "jaz-service2-ecr"
  force_delete = true
}

resource "aws_ecr_repository" "service3" {
  name         = "jaz-service3-ecr"
  force_delete = true
}