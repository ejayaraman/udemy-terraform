data "aws_ami" "ami_latest" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

output "ami_id" {
  value = data.aws_ami.ami_latest.image_id
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "auto_instance" {
  ami = data.aws_ami.ami_latest.image_id
  instance_type = "t2.micro"
}