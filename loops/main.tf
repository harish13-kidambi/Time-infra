resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_cidr
    instance_tenancy = local.instance_tenancy
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "Time-vpc"
        Terraform = true
        Environment = "Dev"
        CreateDate = local.current_time
  }
} 

resource "aws_subnet" "Public_subnet" {
  count = local.Public_subnet_length
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

resource "aws_instance" "ec2"{
  ami           = local.ami_id
  instance_type = "t2.micro"  

  tags = {
    Name = "test-ec2"
  }
}