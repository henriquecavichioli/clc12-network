variable "vpc_name" {
    type = string 
    default = "vpc_clc12_terraform"
}

variable "subnet_public_name" {
    type = string 
    default = "tf_public_subnet_1a"
}

variable "subnet_private_name" {
    type = string 
    default = "tf_private_subnet_1a"
}

variable "igw_name" {
    type = string 
    default = "tf_igw"
}

variable "public_rt_name" {
    type = string 
    default = "tf_public_rt"
}

variable "private_rt_name" {
    type = string 
    default = "tf_private_rt"
}

variable "nat_gateway_name" {
    type = string 
    default = "tf_natgw"
}





resource "aws_vpc" "minha_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.minha_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_public_name
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id  = aws_vpc.minha_vpc.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_private_name
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.minha_vpc.id

  tags = {
    Name = var.igw_name
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}


resource "aws_route_table_association" "public_rt_associate" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_eip" "nat_gw_ip" {
  domain   = "vpc"
}


resource "aws_nat_gateway" "natgw_1a" {
  allocation_id = aws_eip.nat_gw_ip.id
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = var.nat_gateway_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw_1a.id
  }

  tags = {
    Name = var.private_rt_name
  }
}


resource "aws_route_table_association" "private_rt_associate" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
