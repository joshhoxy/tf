resource "aws_subnet" "sbn-dev-dmz-pri-a" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = var.az-a
  cidr_block        = var.sbn-dev-dmz-pri-a-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-pri-a-name
    },
    var.tags-josh-test
  )
}

resource "aws_subnet" "sbn-dev-dmz-pri-c" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = var.az-a
  cidr_block        = var.sbn-dev-dmz-pri-c-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-pri-c-name
    },
    var.tags-josh-test
  )
}