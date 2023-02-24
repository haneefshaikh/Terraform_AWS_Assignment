data "aws_ami" "ec2_ami" {
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

resource "aws_instance" "web_ec2" {
  ami                    = data.aws_ami.ec2_ami.id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.cloudethix-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.cloudethix-sub-public01.id

}
