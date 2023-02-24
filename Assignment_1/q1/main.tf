#AWS Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


// IAM GROUP

resource "aws_iam_group" "application_group" {
  name = var.iam_group_name
  path = var.iam_group_path
}

// IAM USER

resource "aws_iam_user" "application_users" {
  name = var.iam_user_name
  path = var.iam_user_path
}

// IAM GROUP MEMBER

resource "aws_iam_user_group_membership" "application_group_members" {
  user = aws_iam_user.application_users.name
  groups = [
    aws_iam_group.application_group.name
  ]
}