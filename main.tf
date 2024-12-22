provider "aws" {
  region = var.region # Specify your preferred AWS region
}

resource "aws_iam_user" "intern_user" {
  name = var.intern_user
  path = "/"
  tags = {
    Department = "Interns"
    Role       = "Intern"
  }
}

resource "aws_iam_group" "intern_group" {
  name = var.intern-group
  path = "/"
}

resource "aws_iam_user_group_membership" "intern_membership" {
  user = aws_iam_user.intern_user.name
  groups = [
    aws_iam_group.intern_group.name
  ]
}

resource "aws_iam_policy" "intern_policy" {
  name        = var.intern_policy
  policy      = file("iam_policy.json")
}

resource "aws_iam_group_policy_attachment" "attach_policy" {
  group      = aws_iam_group.intern_group.name
  policy_arn = aws_iam_policy.intern_policy.arn
}

resource "aws_iam_account_alias" "account_alias" {
  account_alias = var.intern-alias
}
