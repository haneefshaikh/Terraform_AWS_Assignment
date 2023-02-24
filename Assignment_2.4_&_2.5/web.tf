#WEB Security Group

resource "aws_security_group" "cloudethix-sg-web" {
  name        = "allow_web"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  ingress {
    description      = "web from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.cloudethix-lb-sg.id}"]
  }

  ingress {
    description      = "web from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.cloudethix-lb-sg.id}"]
  }

  tags = {
    Name = "3T-WEB"
  }
}

#WEB EC2

  resource "aws_instance" "web" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.cloudethix-key-pair.key_name}"
  security_groups = [aws_security_group.cloudethix-sg-web.id]
  subnet_id     = aws_subnet.cloudethix-sub-public01.id

  tags = {
    Name = "3T-WEB"
  }
}