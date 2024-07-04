data "aws_ami" "amazon-linux-2" {
  most_recent = true


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  owners = ["amazon"]
}

data "aws_availability_zones" "available" {
  state = "available"

}
