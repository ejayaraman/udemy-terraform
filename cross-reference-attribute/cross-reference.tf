provider "aws" {
  region = "eu-west-2"
}

resource "aws_eip" "test_eip" {
  domain   = "vpc"

  tags = {
    Name = "terraform_eip"
  }
}

resource "aws_security_group" "test_security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.test_eip.public_ip}/32"]
  }

  tags = {
    Name = "allow_tls_from_terraform"
  }
}