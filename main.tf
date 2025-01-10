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
      tasks_iam_role_arn                 = module.service1_role.iam_role_arn
    }

    jaz-service2 = {
      cpu    = 512
      memory = 1024
      container_definitions = {
        jaz-service2-container = {
          essential = true
          image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/jaz-service2-ecr:latest"
          port_mappings = [
            {
              containerPort = 8081
              protocol      = "tcp"
            }
          ]
        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                         = flatten(data.aws_subnets.public.ids)
      security_group_ids                 = [module.service2_sg.security_group_id]
      create_tasks_iam_role              = false
      tasks_iam_role_arn                 = module.service2_role.iam_role_arn
    }

    jaz-service3 = {
      cpu    = 512
      memory = 1024
      container_definitions = {
        jaz-service3-container = {
          essential = true
          image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/jaz-service3-ecr:latest"
          port_mappings = [
            {
              containerPort = 8082
              protocol      = "tcp"
            }
          ]
        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                         = flatten(data.aws_subnets.public.ids)
      security_group_ids                 = [module.service3_sg.security_group_id]
      create_tasks_iam_role              = false
      tasks_iam_role_arn                 = module.service3_role.iam_role_arn
    }
  }
}
