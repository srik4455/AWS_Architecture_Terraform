variable "InstanceNames" {
  type    = list(string)
  default = ["web1", "web2"]

}
variable "sg_id" {
  description = "SG ID for Instances"
  type        = string

}

variable "subnets" {
  description = "Subnets for Instances"
  type        = list(string)

}
