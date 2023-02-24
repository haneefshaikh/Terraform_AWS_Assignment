
#VPC
resource "aws_vpc" "cloudethix-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "3T-VPC"
  }
}

#private subnets 
resource "aws_subnet" "cloudethix-sub-private01" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "3T-SUB-PRIVATE"
  }
}

resource "aws_subnet" "cloudethix-sub-private02" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "3T-SUB-PRIVATE"
  }
}


#public subnets 
resource "aws_subnet" "cloudethix-sub-public01" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "3T-SUB-PUBLIC"
  }
}

resource "aws_subnet" "cloudethix-sub-public02" {
  vpc_id                  = aws_vpc.cloudethix-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "3T-SUB-PUBLIC"
  }
}


#Elastic IP
resource "aws_eip" "cloudethix-eip" {
  vpc      = true

  tags = {
    Name = "3T-EIP"
  }
}


#IGW 
resource "aws_internet_gateway" "cloudethix-igw" {
  vpc_id = aws_vpc.cloudethix-vpc.id

  tags = {
    Name = "3T-IGW"
  }
}


#Public NAT
resource "aws_nat_gateway" "cloudethix-nat" {
  allocation_id = aws_eip.cloudethix-eip.id
  subnet_id     = aws_subnet.cloudethix-sub-public01.id

  tags = {
    Name = "3T-NAT"
  }
}


#Route Table
resource "aws_route_table" "cloudethix-RT-public" {
  vpc_id = aws_vpc.cloudethix-vpc.id

  tags = {
    Name = "3T-RT-PUBLIC"
  }
}

resource "aws_route_table" "cloudethix-RT-private" {
  vpc_id = aws_vpc.cloudethix-vpc.id

  tags = {
    Name = "3T-RT-PRIVATE"
  }
}


#Route
resource "aws_route" "cloudethix-route-public" {
  route_table_id            = aws_route_table.cloudethix-RT-public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.cloudethix-igw.id
}

resource "aws_route" "cloudethix-route-private" {
  route_table_id            = aws_route_table.cloudethix-RT-private.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_nat_gateway.cloudethix-nat.id
}

#Route Table Association
resource "aws_route_table_association" "cloudethix-RTASS-public" {
  subnet_id      = aws_subnet.cloudethix-sub-public01.id
  route_table_id = aws_route_table.cloudethix-RT-public.id
}

resource "aws_route_table_association" "cloudethix-RTASS-private" {
  subnet_id     = aws_subnet.cloudethix-sub-private01.id
  route_table_id = aws_route_table.cloudethix-RT-private.id
}