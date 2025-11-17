resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_static.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "public-nat"
  }
  depends_on = [aws_internet_gateway.igw]
}
