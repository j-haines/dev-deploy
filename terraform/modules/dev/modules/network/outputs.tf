output "subnet" {
  value = {
    subnet_id  = aws_subnet.subnet.id
    subnet_arn = aws_subnet.subnet.arn
  }
}
