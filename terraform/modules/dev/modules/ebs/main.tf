data "aws_ebs_volume" "home" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "tag:User"
    values = [var.user]
  }
}
