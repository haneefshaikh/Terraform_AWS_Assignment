
#Application EC2

  resource "aws_instance" "app" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  key_name          = aws_key_pair.cloudethix-key-pair.key_name
  security_groups   = ["${aws_security_group.cloudethix-sg-app.id}"]
  subnet_id         = aws_subnet.cloudethix-sub-public01.id
}