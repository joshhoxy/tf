resource "aws_subnet" "sbn-dev-int-pri-a" {
  vpc_id            = aws_vpc.vpc-dev-int.id
  availability_zone = data.aws_availability_zones.all.names[0]
  cidr_block        = var.sbn-dev-int-pri-a-cidr
  tags = merge(
    {
      Name      = var.sbn-dev-int-pri-a-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}

resource "aws_subnet" "sbn-dev-int-pri-c" {
  vpc_id            = aws_vpc.vpc-dev-int.id
  availability_zone = data.aws_availability_zones.all.names[2]
  cidr_block        = var.sbn-dev-int-pri-c-cidr
  tags = merge(
    {
      Name      = var.sbn-dev-int-pri-c-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}