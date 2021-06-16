terraform {
  backend "s3" {
    bucket = "jenkins-bucket-tfstate"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
    region = "ap-south-1"

  
}

module "dev_vpc" {
    source = "../modules/vpc"
    vpc_cidr = "192.168.0.0/16"
    vpc_id = "${module.dev_vpc.vpc_id}"
    subnet_cidr = "192.168.0.0/24"
    
}

module "dev_ec2" {
    source = "../modules/ec2"
    ami_id = "ami-0ad704c126371a549"
    type = "t2.nano"
    subnet_id = "${module.dev_vpc.subnet_id}"
    
    
}