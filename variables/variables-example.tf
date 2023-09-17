provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "variable_instance" {
  ami = "ami-084e8c05825742534"
  instance_type = var.instance_type

  tags = {
    name = "variable-instance"
  }
}

