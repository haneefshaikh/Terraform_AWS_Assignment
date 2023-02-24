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
    security_groups  = ["${aws_security_group.cloudethix-sg-web.id}"]
  }

  tags = {
    Name = "3T-app"
  }
}


#Application EC2

  resource "aws_instance" "app" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.cloudethix-key-pair.key_name
  security_groups = ["${aws_security_group.cloudethix-sg-web.id}"]
  subnet_id     = aws_subnet.cloudethix-sub-private01.id

  tags = {
    Name = "3T-app"
  }
}