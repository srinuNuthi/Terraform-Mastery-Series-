terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

# Creating a VPC with CIDR block 10.0.0.0/16
resource "aws_vpc" "trailvpc" {
  cidr_block = "10.0.0.0/16"
}

# Creating four subnets within the VPC with hardcoded CIDR blocks
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.trailvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subnet-1"
  }
  depends_on = [aws_vpc.trailvpc] # Ensures the VPC is created first
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.trailvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "subnet-2"
  }
  depends_on = [aws_vpc.trailvpc] # Ensures the VPC is created first
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.trailvpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "subnet-3"
  }
  depends_on = [aws_vpc.trailvpc] # Ensures the VPC is created first
}

resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.trailvpc.id
  cidr_block = "10.0.4.0
