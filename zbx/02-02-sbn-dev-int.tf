resource "aws_subnet" "sbn-dev-int-ext-1" {
  vpc_id            = aws_vpc.vpc-dev-int.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block        = var.sbn-dev-int-ext-1-cidr

  tags = merge(
    {
      Name = var.sbn-dev-int-ext-1-name
    },
    var.tags-josh-default
  )
}

resource "aws_subnet" "sbn-dev-int-ap-1" {
  vpc_id            = aws_vpc.vpc-dev-int.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block        = var.sbn-dev-int-ap-1-cidr

  tags = merge(
    {
      Name = var.sbn-dev-int-ap-1-name
    },
    var.tags-josh-default
  )
}