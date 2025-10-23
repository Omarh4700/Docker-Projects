#  AWS VPC and EC2 Infrastructure with Terraform

This project provisions a **highly available AWS network and compute environment** using **Terraform**.  
It creates a Virtual Private Cloud (VPC), networking components, and an EC2 instance running Apache web server — all fully automated and ready for testing or learning.

---

##  Project Overview

The Terraform configuration automates deployment of the following AWS resources:

| Resource | Description |
|-----------|--------------|
| **VPC (`lab-vpc`)** | Custom Virtual Private Cloud with CIDR `10.0.0.0/16`. |
| **Internet Gateway (`lab-igw`)** | Provides internet connectivity for resources within the VPC. |
| **Public Subnet (`lab-public-subnet`)** | A publicly accessible subnet with auto-assigned public IPs. |
| **Route Table (`lab-public-rt`)** | Configured to route all external traffic (`0.0.0.0/0`) via the Internet Gateway. |
| **Security Group (`lab-sg`)** | Allows inbound SSH (port 22) and HTTP (port 80), and all outbound traffic. |
| **EC2 Instance (`lab-ec2`)** | Amazon Linux 2 instance running Apache HTTPD, deployed in the public subnet. |

Once deployed, the EC2 instance hosts a simple web page confirming successful provisioning via Terraform.

---

##  Prerequisites

Before you begin, ensure you have the following tools installed and configured:

- **Terraform** ≥ v1.0.0  
- **AWS CLI** with valid IAM credentials  
- **AWS account** with sufficient permissions to create:
  - VPC, subnets, gateways, and route tables  
  - EC2 instances and security groups  

---

##  Deployment Steps

1. **Clone this repository**
   ```bash
   git clone https://github.com/Omarh4700/Labs/tree/main/Cloud/Lab1.git
   cd lab1
   ```
   
2. **Initialize Terraform**
   ```bash
   terraform init
   ```
   
3. **Validate the configuration**
   ```bash
   terraform validate
   ```
4. **Review plan and then Apply**
   ```bash
   terraform plan
   terraform apply
   ```
>Type ``yes`` when prompted to confirm.

## 🌐 Accessing the Deployed Instance

After successful deployment:
1. Navigate to the AWS Console → EC2 → Instances.
2. Copy the Public IPv4 address of the EC2 instance.
3. Open a browser and visit: ``http://<your-ec2-public-ip>``

<img width="1329" height="523" alt="image" src="https://github.com/user-attachments/assets/fd503e58-59cf-4b49-a67d-fb86e0141359" />

## Cleanup
To remove all created resources and avoid incurring charges, run:
```bash
terraform destroy
```
> Confirm with ``yes`` when prompted.

> [!NOTE]
>  - The AMI used ``(ami-0a5b0d219e493191b)`` is specific to the ``eu-central-1`` region. Update this ID if deploying to another AWS region.
> - Ensure SSH access is allowed in your network if you intend to connect to the instance directly.
> - This setup is ideal for training, testing, or demo purposes — not production use.

