terraform {
  cloud {
    organization = "TEST_ENTERPRISSE"
    workspaces {
      name = "Terraform_test"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server2"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-0cd7c314c94dd8987"

  ingress_cidr_blocks = ["172.16.30.4/32"]
}
