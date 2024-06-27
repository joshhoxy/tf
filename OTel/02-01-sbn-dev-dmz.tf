resource "aws_subnet" "sbn-dev-dmz-pub-1" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block        = var.sbn-dev-dmz-pub-1-cidr
  map_public_ip_on_launch = true
  
  tags = merge(
    {
      Name = var.sbn-dev-dmz-pub-1-name
    },
    var.tags-josh-default
  )
}

resource "aws_subnet" "sbn-dev-dmz-pub-2" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-3-number}"]
  cidr_block        = var.sbn-dev-dmz-pub-2-cidr
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name = var.sbn-dev-dmz-pub-2-name
    },
    var.tags-josh-default
  )
}


resource "aws_subnet" "sbn-dev-dmz-ap-1" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block        = var.sbn-dev-dmz-ap-1-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-ap-1-name
    },
    var.tags-josh-default
  )
}

resource "aws_subnet" "sbn-dev-dmz-ap-2" {
  vpc_id            = aws_vpc.vpc-dev-dmz.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-3-number}"]
  cidr_block        = var.sbn-dev-dmz-ap-2-cidr

  tags = merge(
    {
      Name = var.sbn-dev-dmz-ap-2-name
    },
    var.tags-josh-default
  )
}