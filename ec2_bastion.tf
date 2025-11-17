data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = false   # NO auto public IP; we attach EIP
  tags = { Name = "ec2-bastion" }
}

resource "aws_eip_association" "bastion_assoc" {
  allocation_id = aws_eip.bastion_static.id
  instance_id   = aws_instance.bastion.id
}
