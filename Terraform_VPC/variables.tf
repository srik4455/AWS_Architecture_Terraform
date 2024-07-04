variable "my_vpc_CIDR" {
  type        = string
  description = "my VPC CIDR range"

}
variable "my_public_subnet_CIDR" {
  type = list(string)

}


