variable "my_vpc_CIDR" {
  type = string

}
variable "my_public_subnet_CIDR" {
  type = list(string)

}

variable "my_public_subnet_names" {
  type    = list(string)
  default = ["publicSubnet1", "publicSubnet2"]

}
