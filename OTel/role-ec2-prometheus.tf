resource "aws_iam_role" "role-dev-ec2-prometheus" {
  name = var.role-dev-ec2-prometheus-name

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

  tags = merge(
    {
      Name = var.role-dev-ec2-prometheus-name
    },
    var.tags-josh-default
  )


}

### Managed Policy ###
resource "aws_iam_role_policy_attachment" "role-dev-ec2-prometheus-policya-1" {
  role       = aws_iam_role.role-dev-ec2-prometheus.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "role-dev-ec2-prometheus-policya-2" {
  role       = aws_iam_role.role-dev-ec2-prometheus.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "role-dev-ec2-prometheus-policya-3" {
  role       = aws_iam_role.role-dev-ec2-prometheus.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

### Instance Profile ###
resource "aws_iam_instance_profile" "role-dev-ec2-prometheus" {
  name = var.role-dev-ec2-prometheus-name
  role = aws_iam_role.role-dev-ec2-prometheus.name
}