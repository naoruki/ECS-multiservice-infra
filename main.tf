data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

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

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.9.0"

  cluster_name = "jaz-multiservice-ecs"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }

  services = {
    jaz-service1 = {
      cpu    = 512
      memory = 1024
      container_definitions = {
        jaz-service1-container = {
          essential = true
          image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/jaz-service1-ecr:latest"
          port_mappings = [
            {
              containerPort = 8080
              protocol      = "tcp"
            }
          ]
        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                         = flatten(data.aws_subnets.public.ids)
      security_group_ids                 = [module.service1_sg.security_group_id]
      create_tasks_iam_role              = false
      tasks_iam_role_arn                 = "arn:aws:iam::255945442255:role/ce6-capstone-group3-ecs-task"
    }
  }
}

module "service1_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "jaz-service1-ecs-sg"
  description = "Security group for ecs"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
}