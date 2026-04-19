terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "ecs-state-file-lock"
    key    = "infra/terraform.tfstate"
    region = "eu-west-1"
    # dynamodb_table = "terraform-ecs-locks"
    encrypt      = true
    use_lockfile = true
  }
}