
// IAM GROUP

resource "aws_iam_group" "application_group" {
  name  = var.iam_group_name[count.index]
  path  = var.iam_group_path
  count = 3
}

// IAM USER

resource "aws_iam_user" "application_users" {
  name  = var.iam_user_name[count.index]
  path  = var.iam_user_path
  count = 3
}

// IAM GROUP MEMBER

resource "aws_iam_user_group_membership" "application_group_members" {
  user   = aws_iam_user.application_users[count.index].name
  groups = [aws_iam_group.application_group[count.index].name]
  count  = 3
}