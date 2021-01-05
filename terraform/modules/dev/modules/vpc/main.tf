resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
}
