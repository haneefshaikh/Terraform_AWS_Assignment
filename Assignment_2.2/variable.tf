
// IAM GROUP
variable "iam_group_name" {
  type = list(any)
}

variable "iam_group_path" {
  type = string
}

// IAM USER
variable "iam_user_name" {
  type = list(any)
}

variable "iam_user_path" {
  type = string
}

//EC2
variable "ENV" {
  type = string
}

variable "dev_type" {
  type = string
}

variable "qa_type" {
  type = string
}

//SG
variable "dev_port" {
  type = list(any)
}

variable "qa_port" {
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

