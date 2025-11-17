resource "aws_instance" "proxy" {
  ami                         = var.proxy_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]

  tags = { Name = "proxy-server" }
}

resource "aws_eip" "proxy_eip" {
  instance = aws_instance.proxy.id
  domain = "vpc"
}
