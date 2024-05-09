resource "aws_vpc" "vpc-dev-dmz" {
  cidr_block           = var.vpc-dev-dmz-cidr
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc-dev-dmz-name
    },
    var.tags-josh-default
  )
}

resource "aws_vpc" "vpc-dev-int" {
  cidr_block           = var.vpc-dev-int-cidr
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc-dev-int-name
    },
    var.tags-josh-default
  )
}


### IGW
resource "aws_internet_gateway" "JOSH-OTL-DMZ-IGW-1" {
  vpc_id = aws_vpc.vpc-dev-dmz.id

  tags = merge(
    {
      Name = var.igw-dev-dmz-name
    },
    var.tags-josh-default
  )
}

### OUTPUT
output "vpc-dev-dmz-id" {
  value = aws_vpc.vpc-dev-dmz.id
}

output "vpc-dev-int-id" {
  value = aws_vpc.vpc-dev-int.id
}

output "josh-otl-dmz-igw-id" {
  value = aws_internet_gateway.JOSH-OTL-DMZ-IGW-1.id
}

