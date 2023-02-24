// VPC

variable "availability_zone" {
  type = list
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr" {
  type = list
}

variable "private_subnet_cidr" {
  type = list
}

variable "destination_cidr_block" {
  type = string
}

// EC2

variable "ec2_ami_id" {
    type = string
}

variable "ec2_instance_type" {
    type = string
}