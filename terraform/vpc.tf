# Terraform 资源定义，用于创建一个 AWS 虚拟私有云（VPC）。

resource "aws_vpc" "vpc" {
# resource 关键字用于声明一个 Terraform 资源。
# "aws_vpc" 指明了资源类型，这里表示它是一个 AWS VPC。
# "vpc" 是此特定资源的本地名称，您在 Terraform 配置中引用此 VPC 时将使用这个名称。
    cidr_block = "10.10.0.0/16"
    # cidr_block 属性指定了 VPC 的 IP 地址范围。
    # 这里使用的是 "10.10.0.0/16"，表示这个 VPC 将拥有从 10.10.0.0 到 10.10.255.255 的 IP 地址范围。
    enable_dns_hostnames = true
    # 允许在 VPC 中的实例与私有 DNS 主机名关联。
    enable_dns_support = true
    # 表示在 VPC 中启用了 DNS 支持，允许 Amazon Route 53 解析 DNS 主机名
}

# 感觉VPC是用来为各种资源指定IP地址范围，用于网络隔离和安全，外部通信和第三方交互