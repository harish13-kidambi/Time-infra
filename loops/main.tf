resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "Time-vpc"
        Terraform = true
        Environment = "Dev"
  }
} 

resource "aws_subnet" "Public_subnet" {
  count = length(var.pub_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = var.pub_subnet_names[count.index]
  }
}

resource "aws_subnet" "Private_subnet" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.Name
  }
}