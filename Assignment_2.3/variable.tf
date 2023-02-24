// SSH KEY PAIR 
variable "ssh_key_name" {
  type = string
}

//EC2
variable "ec2_instance_type" {
  type = string
}

//SG
variable "alb_sg_port" {
  type = list(any)
}
variable "web_sg_port" {
  type = list(any)
}

// VPC
variable "availability_zone" {
  type = list(any)
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(any)
}

variable "private_subnet_cidr" {
  type = list(any)
}

variable "destination_cidr_block" {
  type = string
}

