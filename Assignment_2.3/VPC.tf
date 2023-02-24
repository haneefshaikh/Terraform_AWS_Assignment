
locals {
  common_tags = {
    user = "vpc"
  }
}

#VPC
resource "aws_vpc" "cloudethix-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags             = local.common_tags
}

#private subnets 
resource "aws_subnet" "cloudethix-sub-private01" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = var.private_subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true
  tags                    = local.common_tags
}

resource "aws_subnet" "cloudethix-sub-private02" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = var.private_subnet_cidr[1]
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = true
  tags                    = local.common_tags
}

#public subnets 
resource "aws_subnet" "cloudethix-sub-public01" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = var.public_subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true
  tags                    = local.common_tags
}

resource "aws_subnet" "cloudethix-sub-public02" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = var.public_subnet_cidr[1]
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = true
  tags                    = local.common_tags
}

#Elastic IP
resource "aws_eip" "cloudethix-eip" {
  vpc  = true
  tags = local.common_tags
}

#IGW 
resource "aws_internet_gateway" "cloudethix-igw" {
  vpc_id = aws_vpc.cloudethix-vpc.id
  tags   = local.common_tags
}

#Public NAT
resource "aws_nat_gateway" "cloudethix-nat" {
  allocation_id = aws_eip.cloudethix-eip.id
  subnet_id     = aws_subnet.cloudethix-sub-public01.id
  tags          = local.common_tags
}

#Route Table
resource "aws_route_table" "cloudethix-RT-public" {
  vpc_id = aws_vpc.cloudethix-vpc.id
  tags   = local.common_tags
}

resource "aws_route_table" "cloudethix-RT-private" {
  vpc_id = aws_vpc.cloudethix-vpc.id
  tags   = local.common_tags
}

#Route
resource "aws_route" "cloudethix-route-public" {
  route_table_id         = aws_route_table.cloudethix-RT-public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.cloudethix-igw.id
}

resource "aws_route" "cloudethix-route-private" {
  route_table_id         = aws_route_table.cloudethix-RT-private.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_nat_gateway.cloudethix-nat.id
}

#Route Table Association
resource "aws_route_table_association" "cloudethix-RTASS-public" {
  subnet_id      = aws_subnet.cloudethix-sub-public01.id
  route_table_id = aws_route_table.cloudethix-RT-public.id
}

resource "aws_route_table_association" "cloudethix-RTASS-private" {
  subnet_id      = aws_subnet.cloudethix-sub-private01.id
  route_table_id = aws_route_table.cloudethix-RT-private.id
}



