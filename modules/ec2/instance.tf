resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.web-subnet.id}"

  tags = {
    Name = "jenkins-vm"
  }
}

provider "aws" {
    region = var.region
}


resource "aws_vpc" "terra-demo-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = "jenkins-terragrunt-vpc"
    }
}
resource "aws_subnet" "web-subnet" {
    vpc_id = "${aws_vpc.terra-demo-vpc.id}"
    cidr_block = var.subnet_cidr
    availability_zone = "ap-south-1a"
    tags = {
      Name = "jenkins-terragrunt-websubnet"
    }
}
