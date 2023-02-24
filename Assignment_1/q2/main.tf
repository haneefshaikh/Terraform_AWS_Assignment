#AWS Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

locals {
    common_tags = {
      user = "devops"
    }
}

// EIP
resource "aws_eip" "lb" {
  vpc     = true
  tags    = local.common_tags
}

// EC2 INSTANCE
resource "aws_instance" "my_ec2" {
    ami           = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    tags          = local.common_tags
}

// EIP TO EC2

resource "aws_eip_association" "myeip_assoc" {
  instance_id   = aws_instance.my_ec2.id
  allocation_id = aws_eip.lb.id
}

// OUTPUT

output "OUT_EIP_public_dns" {
  value = aws_eip.lb.public_dns
}

output "OUT_EIP_private_dns" {
  value = aws_eip.lb.private_ip
}

output "OUT_EC2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "OUT_EC2_private_ip" {
  value = aws_instance.my_ec2.private_ip
}