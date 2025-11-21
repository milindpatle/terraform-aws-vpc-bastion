🚀 Terraform AWS VPC Project with Bastion & Proxy 

TA complete AWS public-network architecture built using Terraform, including VPC, Subnets, Internet Gateway, NAT Gateway, Bastion EC2, Proxy EC2, and a full CI/CD pipeline using AWS CodePipeline + CodeBuild.
Terraform state is local only — no S3 backend or DynamoDB locking.

📁 Project File Structure
terraform-aws-vpc-bastion/
│
├── provider.tf
├── variables.tf
├── vpc.tf
├── subnet.tf
├── igw.tf
├── nat_gateway.tf
├── route_tables.tf
├── security_groups.tf
├── ec2_bastion.tf
├── ec2_proxy.tf
├── outputs.tf
│
├── buildspec.yml
├── .gitignore
│
└── terraform.tfvars     (local only, DO NOT commit)

🧩 Architecture Overview

This project creates:

Network Layer

1 VPC

1 Public Subnet

Internet Gateway

NAT Gateway

Public Route Table

Compute Layer

Bastion EC2 (with EIP)

Proxy EC2 (with EIP)

Security Layer

Bastion SG → SSH allowed from your IP

Proxy SG → SSH allowed only from Bastion

CI/CD Layer

GitHub Repo

AWS CodePipeline

AWS CodeBuild

buildspec.yml (Terraform commands)

💡 Why This Architecture?

This architecture is designed for:

Secure SSH access using Bastion

Controlled internal access using Proxy

Future private subnet expansion using NAT gateway

Modular Terraform (files separated for future updates)

CI/CD automation with CodePipeline + CodeBuild

📌 File-by-File Explanation (Hinglish)
provider.tf

AWS provider define karta hai.
Terraform ko batata hai ki AWS ke sath kaam karna hai.

variables.tf

Saare important inputs (CIDR, AMI, key pair, region).
Baaki files in variables ko use karti hain.

vpc.tf

Main VPC create hoti hai — pura architecture isi ke andar.

subnet.tf

Ek public subnet banta hai jisme EC2 instances launch honge.

igw.tf

Internet Gateway attach hota hai VPC ke sath — internet access enable.

nat_gateway.tf

NAT Gateway future private subnets ke liye internet provide karega.

route_tables.tf

Public route table banata hai + subnet ko IGW se associate karta hai.

security_groups.tf

Bastion aur Proxy ke security rules banate hai:

Bastion: SSH allowed from specific IP.

Proxy: SSH allowed only from Bastion.

ec2_bastion.tf

Bastion EC2 with Elastic IP.

ec2_proxy.tf

Proxy EC2 with Elastic IP (only accessible via Bastion).

outputs.tf

Bastion & Proxy ke public IP display karta hai.

buildspec.yml

CodeBuild me Terraform commands run karta hai:

terraform init

terraform plan

terraform apply

🚀 How to Deploy Locally
1. Initialize
terraform init

2. Validate plan
terraform plan -out=tfplan

3. Apply
terraform apply -auto-approve tfplan

4. Destroy (optional)
terraform destroy -auto-approve

🔧 Setup CI/CD (Manual AWS Console)
1. Push code to GitHub
2. Create IAM Role for CodeBuild

Allow:

EC2

VPC

EIP

CloudWatch

S3 (artifact only)

3. Create CodeBuild Project

Source → GitHub

Buildspec → Use buildspec.yml

Role → codebuild-terraform-role

4. Create CodePipeline

Source → GitHub

Build → CodeBuild project

Deploy → N/A (Terraform apply in build stage)

When code is pushed → pipeline runs automatically → terraform apply hota hai.

🧠 Key Concepts You Can Explain to Your Manager

Architecture fully modular hai — har component ka alag Terraform file.

Route tables separate rakhe for future VPC peering.

Bastion → secure SSH entry point.

Proxy → controlled access via bastion.

NAT → future private subnets ko internet.

CI/CD pipeline ensures infra automatic deploy ho.

📸 Architecture Diagram (ASCII)
                 Internet
                     |
             +----------------+
             | Internet GW    |
             +----------------+
                     |
                 (VPC)
                     |
        +--------------------------+
        |      Public Subnet       |
        +--------------------------+
        | Bastion EC2   | Proxy EC2 |
        |   (EIP)       |   (EIP)   |
        +--------------------------+
                     |
             NAT Gateway (EIP)

🗂 Why This Repo Is Useful

Perfect for DevOps beginners to understand real-world setups

Helps in interviews (Terraform + AWS + Pipeline project)

Reusable architecture for future projects

Secure + modular + scalable
