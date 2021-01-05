variable "ami_id" {
  type    = string
  default = ""
}

variable "aws_region" {
  type = string
}

variable "fqdn" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ssh_key_pair" {
  type = string
}

variable "default_tags" {
  type = map(string)
}
