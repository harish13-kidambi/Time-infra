
resource "aws_vpc" "vpc"{
    cidr_block = var.cidr_block
    instance_tenancy = var.instance_tenancy
    enable_dns_support = var.dns_support
    enable_dns_hostnames = var.dns_hostnames
    tags = merge(
      var.tags, 
      {
        Name = "Time-vpc"
      }
    )
}

resource "aws_subnet" "pub" {
  for_each = var.Public_subnet
  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name = each.value.Name
  }
  
}





# Security group for postgress RDS, 5432
resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "Allow postgress inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "postgress from VPC"
    from_port   = var.postgress_port
    to_port     = var.postgress_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_list
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Time-RDS-Security-Group"
    }
  )
}

# resource "aws_instance" "web_server"{
#   count = 3
#   ami           = "ami-072ec8f4ea4a6f2cf" 
#   instance_type = "t2.micro"

#   tags = {
#     Name = var.instance_name[count.index]
#   }
# }

resource "aws_key_pair" "kubernetes" {
  key_name   = "kubernetes"
  public_key = file("C:\\Users\\Harish\\kubernetes.pub")
}


resource "aws_instance" "condition"{
  key_name = aws_key_pair.kubernetes.key_name
  ami           = "ami-072ec8f4ea4a6f2cf" 
  instance_type = var.env == "PROD" ? "t3.large" : "t2.micro"

  tags = merge(
    var.tags,
    {
      Name = "Time-ec2"
    }
  )
}