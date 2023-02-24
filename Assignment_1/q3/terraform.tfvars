
// VPC
availability_zone      = ["us-east-1a", "us-east-1b"]
vpc_cidr_block         = "10.0.0.0/16"
public_subnet_cidr     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr    = ["10.0.3.0/24", "10.0.4.0/24"]
subnet_cidr            = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
destination_cidr_block = "0.0.0.0/0"


// EC2
ec2_ami_id          = "ami-0aa7d40eeae50c9a9"
ec2_instance_type   = "t2.micro"
