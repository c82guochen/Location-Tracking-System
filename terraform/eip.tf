resource "aws_eip" "eip_1" {
    // enable eip and its depended internet gateway
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_eip" "eip_2" {
  depends_on = [ aws_internet_gateway.igw ]
}

# NAT 网关（Network Address Translation Gateway）和 EIP（Elastic IP Address，弹性 IP 地址）在云服务中，特别是在 AWS（亚马逊网络服务）中，常常一起使用来实现特定的网络架构目标。
# 1. EIP 作为 NAT 网关的公网地址
# 当您在 AWS 中创建一个 NAT 网关时，通常需要为其分配一个弹性 IP 地址（EIP）。这个 EIP 成为 NAT 网关在公网上的标识，使得私有子网中的实例可以通过 NAT 网关访问互联网，同时保持实例的私有性和安全性。
# NAT 网关通过绑定的 EIP 与互联网通信。这意味着从私有子网出去的所有流量都会被 NAT 网关转换成这个 EIP，而对外界服务而言，源 IP 地址就是这个 EIP。
# 2. 使私有网络中的实例能够访问互联网
# 在没有公网 IP 地址的情况下，私有子网中的实例不能直接访问互联网。通过使用 NAT 网关和绑定的 EIP，这些实例可以发送出站请求到互联网，并接收回应，而无需拥有公网 IP 地址。
# 实际上，EIP 为 NAT 网关提供了一个稳定的公网接口，即使 NAT 网关在云基础设施内部移动或重启，EIP 也保持不变，确保了访问的连续性。