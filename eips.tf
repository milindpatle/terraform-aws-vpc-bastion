resource "aws_eip" "bastion_static" {
  domain = true

  tags = {
    Name = "bastion-static-eip"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip" "nat_static" {
   domain = true

  tags = {
    Name = "nat-static-eip"
  }

  lifecycle {
    prevent_destroy = true
  }
}
