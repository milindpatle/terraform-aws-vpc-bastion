resource "aws_instance" "proxy" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  associate_public_ip_address = false   # IMPORTANT: proxy has NO public IP

  tags = { Name = "ec2-proxy" }
}
