data "aws_ami" "dev_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

data "aws_ami" "qa_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "ec2_dev" {
  ami                    = data.aws_ami.dev_ami.id
  instance_type          = var.dev_type
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  subnet_id              = aws_subnet.cloudethix-sub-private01.id
  count                  = var.ENV == "DEV" ? 2 : 0
}

resource "aws_instance" "ec2_qa" {
  ami                    = data.aws_ami.qa_ami.id
  instance_type          = var.qa_type
  vpc_security_group_ids = [aws_security_group.qa_sg.id]
  subnet_id              = aws_subnet.cloudethix-sub-private02.id
  count                  = var.ENV == "QA" ? 1 : 0
}
