resource "aws_security_group_rule" "sgr-dev-dmz-ap-bst-1" {
  security_group_id = aws_security_group.sg-dev-dmz-ap-bst.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow SSH from Any"
}