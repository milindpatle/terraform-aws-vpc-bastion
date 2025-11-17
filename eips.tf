resource "aws_eip" "bastion_static" {
  domain = "vpc"

  tags = {
    Name = "bastion-static-eip"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip" "nat_static" {
   domain = "vpc  "

  tags = {
    Name = "nat-static-eip"
  }

  lifecycle {
    prevent_destroy = true
  }
}
