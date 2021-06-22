remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "jenkins-bucket-tfstate"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}

###############################################
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-south-1"
}
EOF
}
##################################
inputs = {
  ami_id = "ami-0ad704c126371a549"
  instance_type  = "t2.nano"
  region = "ap-south-1"
  subnet_cidr = "192.168.1.0/24"
  vpc_cidr = "192.168.0.0/16"

}
