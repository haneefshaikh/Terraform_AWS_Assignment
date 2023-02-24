# Security Group

resource "aws_security_group" "dev_sg" {
  name        = "dev_sg"
  description = "Allow dev inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  dynamic "ingress" {
    for_each = var.dev_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.dev_port
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "dynamic"
  }
}


resource "aws_security_group" "qa_sg" {
  name        = "qa_sg"
  description = "Allow QA inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  dynamic "ingress" {
    for_each = var.qa_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.qa_port
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "dynamic"
  }
}