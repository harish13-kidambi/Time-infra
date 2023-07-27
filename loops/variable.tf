variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "pub_cidrs" {
    type = list
    default = ["10.0.1.0/24", "10.0.2.0/24"]
  
}

variable "azs" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]  
}


variable "pub_subnet_names" {
    type = list
    default = ["pub-1a","pub-1b"]
  
}

variable "private_subnets" {
    type = map
    default = {
        private-subnet-1 = {
            Name = "private-1a"
            cidr = "10.0.11.0/24"
            az = "ap-south-1a"
        }


        private-subnet-2 = {
            Name = "private-1b"
            cidr = "10.0.12.0/24"
            az = "ap-south-1b"
        }
    }
}