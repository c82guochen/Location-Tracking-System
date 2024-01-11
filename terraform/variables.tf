# 首先terraform会来file找相关变量，如果没有就会去找git actions中找全局变量（secret）
variable "aws_region" {
  
}

variable "app_name" {
  default = "Location-Tracking-System-Vendor-Network"
  description = "Name of the application"  
}

# 配了公网和子网，以免一方被占用（定义一些网络range，理解成配置VPC的路由）
variable "public_subnets" {
    default = ["10.10.100.0/24", "10.10.101.0/24"]
}

variable "private_subnets" {
    default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "availability_zones" {
    default = ["us-east-1a", "us-east-1b"]  
}

# 私有地址空间：10.0.0.0 到 10.255.255.255 范围内的地址属于私有地址空间，
# 意味着这些地址在全球范围内是不唯一的，仅在本地或内部网络中有效。
# 这使得它们非常适合用于内部网络，如企业网络或云环境中的虚拟私有云（VPC）

# 容量规划：每个子网的大小由其子网掩码决定，例如 /24 表示子网掩码为 255.255.255.0，
# 提供了 256 个 IP 地址（实际可用地址稍少，因为需要排除网络地址和广播地址）。
# 这样的规划允许根据需要分配足够数量的 IP 地址。

# IPv4的地址是32位的，/24代表前24位是固定的，用于标识网络。
# 例如，在地址 10.10.100.0/24 中，10.10.100 部分是网络地址。剩下的 8 位用于主机地址：这提供了 
# 2^8=256个可能的组合。这些组合用于区分同一网络内的不同设备（或主机）。