resource "aws_subnet" "sbn-dev-dmz-pub-a" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names[0]
  cidr_block        = var.sbn-dev-dmz-pub-a-cidr
  tags = merge(
    {
      Name      = var.sbn-dev-dmz-pub-a-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}

resource "aws_subnet" "sbn-dev-dmz-pub-c" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names[2]
  cidr_block        = var.sbn-dev-dmz-pub-c-cidr
  tags = merge(
    {
      Name      = var.sbn-dev-dmz-pub-c-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}