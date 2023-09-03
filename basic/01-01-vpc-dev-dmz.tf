resource "aws_vpc" "vpc-dev-dmz" {
  cidr_block           = var.vpc-dev-dmz-cidr
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc-dev-dmz-name
    },
    var.tags-josh-test
  )
}

resource "aws_vpc" "vpc-dev-int" {
  cidr_block           = var.vpc-dev-int-cidr
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc-dev-int-name
    },
    var.tags-josh-test
  )
}