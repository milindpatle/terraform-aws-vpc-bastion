output "bastion_ip" {
  value = aws_eip.bastion_eip.public_ip
}

output "proxy_ip" {
  value = aws_eip.proxy_eip.public_ip
}
