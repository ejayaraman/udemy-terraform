provider "aws" {
  region = "eu-west-2"
}

locals {
  tag_name = "instance_count"
}

resource "aws_instance" "instance_example" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  count         = 2

  tags = {
        name = "${local.tag_name}_${count.index+1}"
  }
}