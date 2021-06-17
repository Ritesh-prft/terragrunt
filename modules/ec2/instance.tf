resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.type
  subnet_id = "${aws_subnet.web-subnet.id}"

  tags = {
    Name = "jenkins-vm"
  }
}

provider "aws" {
    region = "ap-south-1"
}


resource "aws_vpc" "terra-demo-vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      "Name" = "jenkins-terragrunt-vpc"
    }
}
resource "aws_subnet" "web-subnet" {
    vpc_id = "${aws_vpc.terra-demo-vpc.id}"
    cidr_block = "192.168.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "jenkins-terragrunt-websubnet"
    }
}
