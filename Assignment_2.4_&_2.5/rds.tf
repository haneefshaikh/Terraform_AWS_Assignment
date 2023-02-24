#RDS Security Group

resource "aws_security_group" "cloudethix-sg-rds" {
  name        = "allow_rds"
  description = "Allow rds inbound traffic"
  vpc_id      = aws_vpc.cloudethix-vpc.id

  ingress {
    description      = "rds from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.cloudethix-sg-app.id}"]
  }

  tags = {
    Name = "3T-RDS"
  }
}


#RDS DB Subnet Group

resource "aws_db_subnet_group" "cloudethix-rds-db-sub" {
  name       = "rds-db-sub"
  subnet_ids = ["${aws_subnet.cloudethix-sub-private01.id}", "${aws_subnet.cloudethix-sub-private02.id}"]

  tags = {
    Name = "3T-RDS"
  }
}


#RDS Instance

resource "aws_db_instance" "cloudethix-rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.cloudethix-rds-db-sub.name
  vpc_security_group_ids = ["${aws_security_group.cloudethix-sg-rds.id}"]
}