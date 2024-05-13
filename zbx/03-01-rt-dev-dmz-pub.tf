#### Route Table ####

resource "aws_route_table" "rt-dev-dmz-pub" {
  vpc_id = aws_vpc.vpc-dev-dmz.id

  tags = merge(
    {
      Name = var.rt-dev-dmz-pub-name
    },
    var.tags-josh-default
  )
}

#### Route Table Association ####
resource "aws_route_table_association" "rt-dev-dmz-pub-rta-1" {
  route_table_id = aws_route_table.rt-dev-dmz-pub.id
  subnet_id      = aws_subnet.sbn-dev-dmz-pub-1.id
}

resource "aws_route_table_association" "rt-dev-dmz-pub-rta-2" {
  route_table_id = aws_route_table.rt-dev-dmz-pub.id
  subnet_id      = aws_subnet.sbn-dev-dmz-pub-2.id
}


#### Routes ####
resource "aws_route" "rt-dev-dmz-ap-route-1" {
  route_table_id         = aws_route_table.rt-dev-dmz-pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.JOSH-OTL-DMZ-IGW-1.id
  # nat_gateway_id         = "nat-08f01b6fbc3e63e1a"
}
