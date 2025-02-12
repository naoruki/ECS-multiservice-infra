module "service1_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "jaz-service1-ecs-sg"
  description = "Security group for ecs"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5001
      to_port     = 5001
      protocol    = "tcp"
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
}

module "service2_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "jaz-service2-ecs-sg"
  description = "Security group for ecs"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5003
      to_port     = 5003
      protocol    = "tcp"
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
}

module "service3_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "jaz-service3-ecs-sg"
  description = "Security group for ecs"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5002
      to_port     = 5002
      protocol    = "tcp"
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
}