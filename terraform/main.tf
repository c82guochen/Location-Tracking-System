// 首先要新建一个文件夹terraform
// This file is the entry point
terraform {
  required_providers { // 应用平台
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }

  // backend连接的resourses
  backend "s3" {
    
  }
}

provider "aws" {
  region = "${var.aws_region}"
}
