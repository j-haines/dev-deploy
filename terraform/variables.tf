locals {
  ami_id      = ""
  aws_region  = "us-west-2"
  aws_profile = "pangu"

  fqdn          = "gobny.me"
  instance_type = "t3.micro"
  remote_user   = "pangu"
  ssh_key_pair  = "pangu"
}
