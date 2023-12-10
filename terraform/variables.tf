# 首先terraform会来file找相关变量，如果没有就会去找git actions中找全局变量（secret）
variable "aws_region" {
  
}

variable "app_name" {
  default = "Location-Tracking-System-Vendor-Network"
  description = "Name of the application"  
}

# 配了公网和子网，以免一方被占用
variable "public_subnets" {
    default = ["10.10.100.0/24", "10.10.101.0/24"]
}

variable "private_subnets" {
    default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "availability_zones" {
    default = ["us-east-1a", "us-east-1b"]  
}