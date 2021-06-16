resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.type
  subnet_id = var.subnet_id

  tags = {
    Name = "jenkins-vm"
  }
}