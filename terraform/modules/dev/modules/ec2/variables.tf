variable "ami_id" {
  type    = string
  default = ""
}

variable "default_tags" {
  type = map(string)
}

variable "fqdn" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "ssh_key_pair" {
  type = string
}

variable "subnet" {
  type = object({
    subnet_id = string
  })
}
