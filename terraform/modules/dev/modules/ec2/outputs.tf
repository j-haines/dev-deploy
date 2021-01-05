output "eip" {
  value = {
    ip  = aws_eip.eip.public_ip
    dns = aws_eip.eip.public_dns
  }
}
