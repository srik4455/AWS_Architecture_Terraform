variable "sg_id" {
  description = "SG for ALB"
  type        = string

}
variable "vpc_id" {
  description = "VPC for ALB"
  type        = string
}

variable "subnets" {
  description = "Subnets for ALB"
  type        = list(string)

}
variable "ec2_id" {
  description = "EC2 for ALB"
  type        = list(string)

}


