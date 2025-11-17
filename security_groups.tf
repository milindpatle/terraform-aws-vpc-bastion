# Bastion SG: allow SSH from bastion_ssh_from
resource "aws_security_group" "bastion_sg" {
  name   = "bastion-sg"
  vpc_id = aws_vpc.main.id
  description = "Allow SSH from admin CIDR"

  ingress {
    description = "SSH from allowed"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_ssh_from]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}

# Proxy SG: only allow SSH from bastion SG
resource "aws_security_group" "proxy_sg" {
  name   = "proxy-sg"
  vpc_id = aws_vpc.main.id
  description = "Allow SSH only from bastion"

  ingress {
    description = "SSH from bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "proxy-sg" }
}
