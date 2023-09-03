resource "aws_subnet" "sbn-dev-dmz-pub-a" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = var.az-a
  cidr_block        = var.sbn-dev-dmz-pub-a-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-pub-a-name
    },
    var.tags-josh-test
  )
}

resource "aws_subnet" "sbn-dev-dmz-pub-c" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = var.az-a
  cidr_block        = var.sbn-dev-dmz-pub-c-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-pub-c-name
    },
    var.tags-josh-test
  )
}