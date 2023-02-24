#Application Security Group

resource "aws_security_group" "cloudethix-sg-app" {
  name        = "allow_app"
  description = "Allow app inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  ingress {
    description      = "app from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}