resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]

  tags = { Name = "bastion-server" }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  domain = "vpc"
}
