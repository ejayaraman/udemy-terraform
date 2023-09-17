provider "aws" {
  region = "eu-west-2"
}

resource "aws_eip" "output_eip" {
  domain = "vpc"

  tags = {
    Name = "terraform_output_eip"
  }
}

output "public_ip" {
  value = aws_eip.output_eip.public_ip
}

output "all_eip_attributes" {
  value = aws_eip.output_eip
}