resource "aws_ecr_repository" "s3_service" {
  name         = "jaz-s3-service-ecr"
  force_delete = true
}

resource "aws_ecr_repository" "service3" {
  name         = "jaz-sqs-service-ecr"
  force_delete = true
}
