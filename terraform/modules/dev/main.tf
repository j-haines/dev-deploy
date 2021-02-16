module "vpc" {
  source = "./modules/vpc"

  default_tags = var.default_tags
}

module "network" {
  source = "./modules/network"

  vpc = module.vpc.vpc

  availability_zone = "${var.aws_region}a"
  default_tags      = var.default_tags
}

module "security" {
  source = "./modules/security"

  vpc = module.vpc.vpc

  aws_region = var.aws_region
}

module "ebs" {
  source = "./modules/ebs"

  user = var.user
}

module "ec2" {
  source = "./modules/ec2"

  security_group_id = module.security.security_group_id
  subnet            = module.network.subnet
  volume_id         = module.ebs.volume_id

  ami_id        = var.ami_id
  default_tags  = var.default_tags
  fqdn          = var.fqdn
  instance_type = var.instance_type
  ssh_key_pair  = var.ssh_key_pair
}

module "route53" {
  source = "./modules/route53"

  eip = module.ec2.eip

  fqdn = var.fqdn
}
