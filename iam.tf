module "service1_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.52.1"

  trusted_role_services = [
    "ecs-tasks.amazonaws.com"
  ]

  role_requires_mfa = false

  create_role = true
  role_name   = "jaz-service1-ecs-task-role"
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess" #Only for testing purposes
  ]
}

module "service2_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.52.1"

  trusted_role_services = [
    "ecs-tasks.amazonaws.com"
  ]

  role_requires_mfa = false

  create_role = true
  role_name   = "jaz-service2-ecs-task-role"
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess" #Only for testing purposes
  ]
}

module "service3_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.52.1"

  trusted_role_services = [
    "ecs-tasks.amazonaws.com"
  ]
  
  role_requires_mfa = false
 
  create_role = true
  role_name   = "jaz-service3-ecs-task-role"
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess" #Only for testing purposes
  ]
}
