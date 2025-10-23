## Create a VPC
resource "aws_vpc" "lab-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "lab-vpc"
  }
}
## Create an Internet Gateway
resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "lab-igw"
  }
}
## Create a Public Subnet
resource "aws_subnet" "lab-public-subnet" {
  vpc_id                  = aws_vpc.lab-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
    tags = {
     Name = "lab-public-subnet"
        }
}
## Create a Route Table
resource "aws_route_table" "lab-public-rt" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "lab-public-rt"
  }
}
## Create a Route to the Internet Gateway
resource "aws_route" "lab-public-route" {
  route_table_id         = aws_route_table.lab-public-rt.id
  destination_cidr_block =  "0.0.0.0/0" # Route to all IPv4 addresses
  gateway_id             = aws_internet_gateway.lab-igw.id 
}
## Associate the Route Table with the Public Subnet
resource "aws_route_table_association" "lab-public-rt-assoc" {
  subnet_id      = aws_subnet.lab-public-subnet.id
  route_table_id = aws_route_table.lab-public-rt.id
}
## Create a Security Group
resource "aws_security_group" "lab-sg" {
  name        = "lab-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.lab-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
  }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks =  ["0.0.0.0/0"] # Allow HTTP from anywhere
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"] # Allow all outbound traffic
    }
    tags = {
        Name = "lab-sg"
    }
}
## Create an EC2 Instance
resource "aws_instance" "lab-ec2" {
  ami           = "ami-0a5b0d219e493191b" # Amazon Linux 2 AMI in eu-central-1
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = aws_subnet.lab-public-subnet.id
  vpc_security_group_ids = [aws_security_group.lab-sg.id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to the Lab EC2 Instance </h1>" > /var/www/html/index.html
              echo "<p>This server run with terraform </p>" >> /var/www/html/index.html
              EOF
  tags = {
    Name = "lab-ec2"
  }
  }
  ## end of file
  ### End of main.tf
