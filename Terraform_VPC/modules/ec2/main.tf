resource "aws_instance" "webservers" {
  count                       = length(var.InstanceNames)
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [var.sg_id]
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true
  subnet_id                   = var.subnets[count.index]
  user_data                   = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo echo "<h1> Hello World from ${var.InstanceNames[count.index]} </h1
    >" > /var/www/html/index.html   
    
  EOF

  tags = {
    Name = var.InstanceNames[count.index]
  }
}
