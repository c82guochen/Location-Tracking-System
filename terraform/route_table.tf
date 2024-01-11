# Public RT-1
# 连接到 公共子网 1 (aws_subnet.public_1.id)。
# 包含一条路由规则，将所有目的地为 0.0.0.0/0（即互联网流量）的流量定向到 互联网网关 (aws_internet_gateway.igw.id)。
resource "aws_route_table" "public_1" {
  # router table是什么：所属的vpc
  vpc_id = aws_vpc.vpc.id
  # 名字
  tags = {
    Name = "${var.app_name}-rt-public-1"
  }
}

#  route table对应的内容
resource "aws_route" "public_1" {
  route_table_id = aws_route_table.public_1.id
  destination_cidr_block = "0.0.0.0/0" # 最终由系统分配
  gateway_id = aws_internet_gateway.igw.id
}

# route table关联的子网
resource "aws_route_table_association" "public_1" {
  subnet_id = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_1.id
}


# Public RT-2
# 连接到 公共子网 2 (aws_subnet.public_2.id)。
# 同样包含一条路由规则，将所有目的地为 0.0.0.0/0 的流量定向到 互联网网关 (aws_internet_gateway.igw.id)。
resource "aws_route_table" "public_2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app_name}-rt-public-2"
  }
}

resource "aws_route" "public_2" {
  route_table_id = aws_route_table.public_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_2.id
}
# 这意味着公共子网中的任何实例都可以直接访问互联网，同时也可以从互联网接收流量（如果实例配置了公网 IP 或弹性 IP）。

# 注意：public是对应的Internet gateway，而private对应的是NAT gateway
# Private RT-1
# 连接到 私有子网 1 (aws_subnet.private_1.id)。
# 包含一条路由规则，将所有目的地为 0.0.0.0/0 的流量定向到 NAT 网关 1 (aws_nat_gateway.ngw1.id)。
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app_name}-rt-private-1"
  }
}

resource "aws_route" "private_1" {
  route_table_id = aws_route_table.private_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.ngw1.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}


# Private RT-2
# 连接到 私有子网 2 (aws_subnet.private_2.id)。
# 同样包含一条路由规则，将所有目的地为 0.0.0.0/0 的流量定向到 NAT 网关 2 (aws_nat_gateway.ngw2.id)。
resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.app_name}-rt-private-2"
  }
}

resource "aws_route" "private_2" {
  route_table_id = aws_route_table.private_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.ngw2.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}
# 私有子网中的实例无法直接从互联网接收流量，但它们可以通过 NAT 网关访问互联网。
# 这增加了网络的安全性，因为私有子网中的资源对互联网是隐藏的。

# 公共路由表将公共子网中的流量路由到互联网网关，允许直接的互联网访问。
# 而私有路由表将私有子网中的流量路由到 NAT 网关，允许出站互联网访问但阻止入站互联网访问。
# 这种配置是在 AWS VPC 中实现网络隔离和安全访问控制的常见做法。