output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "bastion_public_ip" {
  value = aws_eip.bastion_static.public_ip
}

output "proxy_private_ip" {
  value = aws_instance.proxy.private_ip
}

output "nat_allocation_id" {
  value = aws_eip.nat_static.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}
