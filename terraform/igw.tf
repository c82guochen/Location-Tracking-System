resource "aws_internet_gateway" "igw" {
    # 绑定到哪个VPC上
    vpc_id = aws_vpc.vpc.id
    tags = { # 名字是什么
      Name = "${var.app_name}-igw"
    }
  
}