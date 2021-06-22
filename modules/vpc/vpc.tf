resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "jenkins-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = var.subnet_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "jenkins-web-subnet"
  }
}

output "op_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "op_subnet_id" {
  value = "${aws_subnet.main.id}"
}