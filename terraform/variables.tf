variable "aws_region" {
  // 若没写，会去git actions - secrets中找该内容
}

variable "app_name" {
  default = "Location-Tracking-System-Vendor-Network"
  description = "Name of the application"  
}

variable "public_subnets" {
    default = ["10.10.100.0/24", "10.10.101.0/24"]
}

variable "private_subnets" {
    default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "availability_zones" {
    default = ["us-east-1a", "us-east-1b"]  
}