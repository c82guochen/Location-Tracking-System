# 其实这一步很简单：就是确认要有一个eip依赖于Internet gateway即可
resource "aws_eip" "eip_1" {
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_eip" "eip_2" {
  depends_on = [ aws_internet_gateway.igw ]
}

# 在 AWS 中，弹性公网 IP（EIP）是一个静态 IP 地址，用于动态云计算。
# EIP 可以分配给任何符合条件的 AWS 资源，如 EC2 实例。
# 这种 IP 地址是固定的，即使与资源解绑后也仍保留在您的 AWS 账户下。