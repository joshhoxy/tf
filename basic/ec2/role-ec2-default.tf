resource "aws_iam_role" "role-dev-ec2-default" {
 name =  var.role-dev-ec2-default-name
 
 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

### Managed Policy ###
resource "aws_iam_role_policy_attachment" "role-dev-ec2-default-policya-1" {
 role = aws_iam_role.role-ec2-default
 policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "role-dev-ec2-default-policya-2" {
 role = aws_iam_role.role-ec2-default
 policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

### Instance Profile ###
resource "aws_iam_instance_profile" "role-dev-ec2-default" {
    name = var.role-dev-ec2-default-name
    role = aws_iam_role.role-dev-ec2-default.name
}