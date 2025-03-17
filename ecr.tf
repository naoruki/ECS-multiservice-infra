resource "aws_ecr_repository" "s3_service" {
  name         = "cornelia-s3-service-ecr"
  force_delete = true
}

resource "aws_ecr_repository" "service3" {
  name         = "cornelia-sqs-service-ecr"
  force_delete = true
}
