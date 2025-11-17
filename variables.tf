variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "key_pair_name" {
  description = "Existing EC2 Key pair name for SSH"
  type        = string
}

variable "bastion_ssh_from" {
  description = "CIDR allowed to SSH to bastion (for demo 0.0.0.0/0 but restrict in prod)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
