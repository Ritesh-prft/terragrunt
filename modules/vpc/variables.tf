variable "vpc_cidr"{
    default = "10.0.0.0/16"
}

variable "vpc_id" {
    default = "aws_vpc.main.id"
}
variable "subnet_cidr"{
    default = "10.0.1.0/24"
}