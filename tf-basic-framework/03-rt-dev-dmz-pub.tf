resource "aws_route_table" "rt-dev-dmz-pub" {
  vpc_id = aws_vpc.vpc-dev-dmz.id
  tags = merge(
    {
      Name      = var.rt-dev-dmz-pub-name
      "Purpose" = "Test"
    },
    var.tags-common
  )
}

### Routes ### 
resource "aws_route" "rt-dev-dmz-pub-route-1" {
  route_table_id         = aws_route_table.rt-dev-dmz-pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.SNBX-AN2-DEV-DMZ-IGW.id
}

### Route Table Association ###

resource "aws_route_table_association" "rt-dev-dmz-pub-rta-1" {
  route_table_id = aws_route_table.rt-dev-dmz-pub.id
  subnet_id      = aws_subnet.sbn-dev-dmz-pub-a.id
}

resource "aws_route_table_association" "rt-dev-dmz-pub-rta-2" {
  route_table_id = aws_route_table.rt-dev-dmz-pub.id
  subnet_id      = aws_subnet.sbn-dev-dmz-pub-c.id
}