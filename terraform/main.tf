# terraform的entry point文件
terraform { # enable terraform
  required_providers {
    aws = { # platform applied
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  # need s3 backend service
  backend "s3" {
    
  }
}

provider "aws" {
  region = "${var.aws_region}"
}