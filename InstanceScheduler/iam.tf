### IAM Role and Policy ###
# Allows Lambda function to describe, stop and start EC2 instances
resource "aws_iam_role" "ec2_start_stop_scheduler" {
  name               = var.iam-role-lmabda-ec2-scheduler
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = merge(
    {
      Name = var.iam-role-lmabda-ec2-scheduler
    },
    var.tags-default
  )
}




resource "aws_iam_policy" "ec2_start_stop_scheduler-1" {
  name   = "ec2_access_scheduler-cw"
  path   = "/"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ],
            "Resource": [
              "*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_policy" "ec2_start_stop_scheduler-2" {
  name   = "ec2_access_scheduler-ec2"
  path   = "/"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "ec2:DescribeInstances",
              "ec2:StopInstances",
              "ec2:StartInstances"
            ],
            "Resource": [
              "*"
            ]
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "ec2_start_stop_scheduler-pol-att-1" {
  role       = aws_iam_role.ec2_start_stop_scheduler.name
  policy_arn = aws_iam_policy.ec2_start_stop_scheduler-1.arn
}

resource "aws_iam_role_policy_attachment" "ec2_start_stop_scheduler-pol-att-2" {
  role       = aws_iam_role.ec2_start_stop_scheduler.name
  policy_arn = aws_iam_policy.ec2_start_stop_scheduler-2.arn
}