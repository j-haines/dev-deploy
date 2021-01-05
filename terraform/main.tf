terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = local.aws_profile
  region  = local.aws_region
}

module "dev" {
  source = "./modules/dev"

  ami_id = local.ami_id

  aws_region = local.aws_region
  fqdn       = local.fqdn

  instance_type = local.instance_type
  ssh_key_pair  = local.ssh_key_pair

  default_tags = {
    AwsRegion = local.aws_region
  }
}
