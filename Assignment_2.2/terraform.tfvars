
// IAM GROUP
iam_group_name = ["dev_0", "dev_1", "dev_2"]
iam_group_path = "/users/"

// IAM USER
iam_user_name = ["haneef_0", "haneef_1", "haneef_2"]
iam_user_path = "/system/"


//EC2
ENV      = "DEV"
dev_type = "t2.micro"
qa_type  = "t2.small"

//SG
dev_port = [22, 80, 443]
qa_port  = [22, 8080, 3306]

// VPC
availability_zone   = ["us-east-1a", "us-east-1b"]
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
//subnet_cidr            = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
destination_cidr_block = "0.0.0.0/0"

