# current using
resource "aws_nat_gateway" "ngw1" {
  # 配置的是Elastic IP（NAT gateway需要有IP漂移的形式）
  allocation_id = aws_eip.eip_1.id
  subnet_id = aws_subnet.public_1.id
  # 附着在internet gateway上 
  depends_on = [ aws_internet_gateway.igw ]

  tags = {
    Name = "${var.app_name}-ngw1"
  }
}

# backup
resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id = aws_subnet.public_2.id

  depends_on = [ aws_internet_gateway.igw ]

  tags = {
    Name = "${var.app_name}-ngw2"
  }
}