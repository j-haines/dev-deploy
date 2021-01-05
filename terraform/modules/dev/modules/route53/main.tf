data "aws_route53_zone" "public" {
  name = var.fqdn
}

resource "aws_route53_record" "devserver" {
  zone_id = data.aws_route53_zone.public.zone_id

  name    = "devserver.${var.fqdn}"
  type    = "CNAME"
  ttl     = "300"
  records = [var.eip.dns]
}
