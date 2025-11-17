# Public route table (for subnet)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "public-rt" }
}

resource "aws_route" "to_igw" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Example placeholder for future peering route (commented)
# resource "aws_route" "from_other_vpc" {
#   route_table_id         = aws_route_table.public_rt.id
#   destination_cidr_block = "10.1.0.0/16"   # other VPC CIDR
#   network_interface_id   = aws_network_interface.some.id # or use vpc peering route
# }
