# 其实这一步很简单：就是确认要有一个eip依赖于Internet gateway即可
resource "aws_eip" "eip_1" {
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_eip" "eip_2" {
  depends_on = [ aws_internet_gateway.igw ]
}