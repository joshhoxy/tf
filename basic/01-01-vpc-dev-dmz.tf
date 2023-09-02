resource "aws_vpc" "vpc-dev-dmz" {
  #provider = aws.dev
  cidr_block           = var.vpc-dev-dmz-cidr
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc-dev-dmz-name
    },
    var.josh-test-dev-tags
  )
}