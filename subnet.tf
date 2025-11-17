resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = false   # we use EIP associations, so don't auto-map
  availability_zone       = var.availability_zone

  tags = {
    Name = "public-subnet"
  }
}
