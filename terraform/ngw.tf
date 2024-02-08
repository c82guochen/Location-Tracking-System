resource "aws_nat_gateway" "ngw1" {
  allocation_id = ...
  subnet_id = aws_subnet.public_1.id
  // 作用在哪个公网下面

  depends_on = [ aws_internet_gateway.igw ]

  tags = {
    Name = "${var.app_name}-ngw1"
  }
}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = ...
  subnet_id = aws_subnet.public_2.id

  depends_on = [ aws_internet_gateway.igw ]

  tags = {
    Name = "${var.app_name}-ngw2"
  }
}

# NAT 网关允许私有网络（如 AWS 中的私有子网）中的实例访问公网（如互联网），同时阻止公网直接访问这些私有网络中的实例。这是通过网络地址转换（NAT）技术实现的，具体工作方式如下：

# 出站访问（私有网络 -> 公网）
  # 私有网络中的实例（如 EC2 实例）发起到公网的请求时（比如访问互联网上的服务），请求会被路由到 NAT 网关。
  # NAT 网关将来自私有网络中实例的源 IP 地址转换为 NAT 网关自己的 IP 地址，并将请求发送到公网。
  # 公网上的服务看到的请求来源 IP 是 NAT 网关的 IP，而不是私有子网中实例的私有 IP 地址。
# 入站访问拒绝（公网 -> 私有网络）
  # 当公网试图直接访问私有网络中的实例时，请求将被阻止，因为 NAT 网关不会转发从公网发起的初始化连接到私有网络。
  # NAT 网关仅转发与私有网络中的实例已经建立的连接的响应流量，这意味着只有当私有网络中的实例首先发起请求时，公网的响应才能通过 NAT 网关回到私有网络中的实例。