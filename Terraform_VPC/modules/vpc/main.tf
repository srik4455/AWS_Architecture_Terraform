#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.my_vpc_CIDR
  instance_tenancy = "default"
  tags = {
    "Name" = "my_vpc"
  }
}
#Subnets

resource "aws_subnet" "mySubnets" {
  vpc_id                  = aws_vpc.my_vpc.id
  count                   = length(var.my_public_subnet_CIDR)
  cidr_block              = var.my_public_subnet_CIDR[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.my_public_subnet_names[count.index]
  }
}

#InternetGateWay

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

#RouteTable

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #since we need it public
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "MyRouteTable"
  }
}

#RouteTableAssociation

resource "aws_route_table_association" "rta" {
  count          = length(var.my_public_subnet_CIDR)
  subnet_id      = aws_subnet.mySubnets[count.index].id
  route_table_id = aws_route_table.rt.id
}
