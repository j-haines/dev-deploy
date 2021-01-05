variable "eip" {
  type = object({
    dns = string
  })
}

variable "fqdn" {
  type = string
}
