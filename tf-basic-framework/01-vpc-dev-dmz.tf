resource "aws_vpc" "vpc-dev-dmz" {
  cidr_block           = var.vpc-dev-dmz-cidr
  enable_dns_hostnames = true
  tags = merge(
    {
      Name      = var.vpc-dev-dmz-name,
      "Purpose" = "Test"
    },
    var.tags-common
  )
}

resource "aws_internet_gateway" "SNBX-AN2-DEV-DMZ-IGW" {
  vpc_id = aws_vpc.vpc-dev-dmz.id
  tags = {
    Name = "SNBX-AN2-DEV-DMZ-IGW"
  }
}


### Outputs ### 
output "vpc-dev-dmz-id" {
  value = aws_vpc.vpc-dev-dmz.id
}