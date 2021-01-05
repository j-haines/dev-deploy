resource "aws_internet_gateway" "gateway" {
  vpc_id = var.vpc.vpc_id
  tags   = var.default_tags
}

resource "aws_subnet" "subnet" {
  vpc_id = var.vpc.vpc_id

  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch         = true

  availability_zone = var.availability_zone
  cidr_block        = var.vpc.cidr_block
  ipv6_cidr_block   = cidrsubnet(var.vpc.ipv6_cidr_block, 8, 1)

  tags = var.default_tags
}

resource "aws_route_table" "rtb" {
  vpc_id = var.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = var.default_tags
}

resource "aws_route_table_association" "rtb" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb.id
}
