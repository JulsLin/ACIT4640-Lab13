provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

module "subnets" {
  source         = "./modules/subnet"
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
  subnets = {
    subnet1 = { cidr_block = "10.0.1.0/24", availability_zone = "us-west-2a", public = true }
    subnet2 = { cidr_block = "10.0.2.0/24", availability_zone = "us-west-2b", public = true }
  }
}

module "instances" {
  source            = "./modules/instance"
  key_name          = module.ssh_key.ssh_key_name
  security_group_id = aws_security_group.main.id
  instances = {
    instance1 = { ami = "ami-03839f1dba75bb628", instance_type = "t2.micro", subnet_id = module.subnets.subnet_ids[0], hostname = "i1" }
    instance2 = { ami = "ami-03839f1dba75bb628", instance_type = "t2.micro", subnet_id = module.subnets.subnet_ids[1], hostname = "i2" }
  }
}

module "dns" {
  source      = "./modules/dns"
  domain_name = "cit.local"
  vpc_id      = module.vpc.vpc_id
  records = {
    instance1 = { name = "i1.cit.local", ip = module.instances.instance_ips["instance1"] }
    instance2 = { name = "i2.cit.local", ip = module.instances.instance_ips["instance2"] }
  }
}
