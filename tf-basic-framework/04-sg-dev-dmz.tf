resource "aws_security_group" "sg-dev-dmz-ap-bst" {
  name        = var.sg-dev-dmz-ap-bst-name
  description = "SG for DEV DMZ Bastion Server"
  vpc_id      = aws_vpc.vpc-dev-dmz.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name    = var.sg-dev-dmz-ap-bst-name
      Purpose = "Test"
    },
    var.tags-common
  )

}