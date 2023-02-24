
#Load Balancer Security Group

resource "aws_security_group" "cloudethix-lb-sg" {
  name        = "allow_lb"
  description = "Allow lb inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  ingress {
    description      = "web from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "web from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "3T-LB"
  }
}

#Load Balancer for WEB

resource "aws_lb" "cloudethix-lb" {
  name               = "3T-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.cloudethix-lb-sg.id]
  subnets            = [aws_subnet.cloudethix-sub-public01.id,aws_subnet.cloudethix-sub-public02.id]
  enable_deletion_protection = true

  tags = {
    Environment = "3T-LB"
  }
}