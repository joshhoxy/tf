resource "aws_security_group" "sg-dev-dmz-pub-bst-1" {
  name        = var.sg-dev-dmz-pub-bst-1-name
  description = "SG for JOSH-OTL Bastion Server"
  vpc_id      = aws_vpc.vpc-dev-dmz.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({
    Name = var.sg-dev-dmz-pub-bst-1-name
    },
    var.tags-josh-default
  )
}

resource "aws_security_group_rule" "sgr-dev-dmz-pub-bst-1" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 30022
  to_port           = 30022
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-dev-dmz-pub-bst-1.id
  description       = "From Developer PC for administration"
}

resource "aws_security_group_rule" "sgr-dev-dmz-pub-bst-2" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["172.16.0.0/22"]
  security_group_id = aws_security_group.sg-dev-dmz-pub-bst-1.id
  description       = "From JOSH-OTL-DMZ-VPC for HTTP"
}

resource "aws_security_group_rule" "sgr-dev-dmz-pub-bst-3" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-dev-dmz-pub-bst-1.id
  description       = "From JOSH-OTL-DMZ-VPC for HTTP"
}