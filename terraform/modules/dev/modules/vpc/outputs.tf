output "vpc" {
  value = {
    vpc_id          = aws_vpc.vpc.id
    cidr_block      = aws_vpc.vpc.cidr_block
    ipv6_cidr_block = aws_vpc.vpc.ipv6_cidr_block
  }
}
