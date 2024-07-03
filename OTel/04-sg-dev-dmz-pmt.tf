resource "aws_security_group" "sg-dev-dmz-pub-pmt-1" {
  name        = var.sg-dev-dmz-pub-pmt-1-name
  description = "SG for JOSH-OTL Bastion Server"
  vpc_id      = aws_vpc.vpc-dev-dmz.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({
    Name = var.sg-dev-dmz-pub-pmt-1-name
    },
    var.tags-josh-default
  )
}


# resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-1" {
#   # provider = aws.snm-dev
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "TCP"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
#   description       = "From Public to prometheus"
# }

# resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-2" {
#   # provider = aws.snm-dev
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "TCP"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
#   description       = "From Public for Zabbix Server Console"
# }

# resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-3" {
#   # provider = aws.snm-dev
#   type              = "ingress"
#   from_port         = 10051
#   to_port           = 10051
#   protocol          = "TCP"
#   cidr_blocks       = ["172.16.0.0/16"]
#   security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
#   description       = "From Zabbix Agent installed on EC2s in VPC"
# }

# resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-4" {
#   # provider = aws.snm-dev
#   type              = "ingress"
#   from_port         = 3000
#   to_port           = 3000
#   protocol          = "TCP"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
#   description       = "From Public for Grafana Server Admin console"
# }

resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-1" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
  description       = "From Public for prometheus console"
}

resource "aws_security_group_rule" "sgr-dev-dmz-pub-pmt-2" {
  # provider = aws.snm-dev
  type              = "ingress"
  from_port         = 13000
  to_port           = 13000
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-dev-dmz-pub-pmt-1.id
  description       = "From Public for Grafana-admin console"
}