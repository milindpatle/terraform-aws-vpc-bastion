variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "bastion_ami" {
  default = "ami-03695d52f0d883f65"
}

variable "proxy_ami" {
  default = "ami-03695d52f0d883f65"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mykey"   
}

variable "ssh_cidr" {
  default = "0.0.0.0/0"   
}
