resource "aws_security_group" "sg-dev-dmz-ap-mgd-1" {
  name        = var.sg-dev-dmz-ap-mgd-1-name
  description = "SG for JOSH-OTL DMZ VPC Application Server"
  vpc_id      = aws_vpc.vpc-dev-dmz.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({
    Name = var.sg-dev-dmz-ap-mgd-1-name
    },
    var.tags-josh-default
  )
}

resource "aws_security_group_rule" "sgr-dev-dmz-ap-mgd-1" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 30022
  to_port           = 30022
  protocol          = "TCP"
  cidr_blocks       = ["${var.ec2-dev-dmz-bst-1-ip}/32"]
  security_group_id = aws_security_group.sg-dev-dmz-ap-mgd-1.id
  description       = "From Developer PC for administration"
}

resource "aws_security_group_rule" "sgr-dev-dmz-ap-mgd-2" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["172.16.0.0/22"]
  security_group_id = aws_security_group.sg-dev-dmz-ap-mgd-1.id
  description       = "Ping Test within Intra Net"
}

resource "aws_security_group_rule" "sgr-dev-dmz-ap-mgd-3" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 10050
  to_port           = 10050
  protocol          = "TCP"
  cidr_blocks       = ["${var.ec2-dev-dmz-zbx-1-ip}/32"]
  security_group_id = aws_security_group.sg-dev-dmz-ap-mgd-1.id
  description       = "From Zabbix Server"
}