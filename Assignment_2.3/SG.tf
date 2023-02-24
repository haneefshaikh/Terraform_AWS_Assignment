# Security Group

resource "aws_security_group" "web_sg" {
  name        = "web"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  dynamic "ingress" {
    for_each = var.web_sg_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.web_sg_port
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    name = "dynamic-WEB"
  }
}



#Load Balancer Security Group

resource "aws_security_group" "alb_sg" {
  name        = "allow_lb"
  description = "Allow lb inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  dynamic "ingress" {
    for_each = var.alb_sg_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.alb_sg_port
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "dynamic-ALB"
  }
}
