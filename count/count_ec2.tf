provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "count_instance" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    name = var.instance_tags[count.index]
  }
}

variable "instance_tags" {
  default = ["dev-instance", "test-instance"]
}