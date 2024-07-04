module "vpc" {
  source                = "./modules/vpc"
  my_vpc_CIDR           = var.my_vpc_CIDR
  my_public_subnet_CIDR = var.my_public_subnet_CIDR

}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id

}

module "ec2" {
  source  = "./modules/ec2"
  sg_id   = module.sg.sg_id
  subnets = module.vpc.subnet_id

}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.subnet_id
  sg_id   = module.sg.sg_id
  ec2_id  = module.ec2.Instance_ID

}
