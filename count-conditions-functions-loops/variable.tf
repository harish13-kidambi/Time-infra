variable "cidr_block" {
    type = string
    default = "10.0.0.0/16" 

}

variable "instance_tenancy" {
    type = string
    default = "default"
  
}

variable "dns_hostnames" {
    type = bool
    default = true

}

variable "dns_support" {
    type = bool
    default = true
  
}

variable "tags" {
    type = map(string)
    default = {
      Name = "Time"
      Terraform = true
      Environment = "Dev"
    }
}

variable "Public_subnet" {
    default = {
        Public-subnet-1 = {
        
            Name = "Public-subnet-1"
            cidr_block = "10.0.1.0/24"
            az = "ap-south-1a"
        }

        Public-subnet-2 = {
             Name = "Public-subnet-2"
            cidr_block = "10.0.2.0/24"
            az = "ap-south-1b"
        }

        Public-subnet-3 = {
             Name = "Public-subnet-3"
            cidr_block = "10.0.3.0/24"
            az = "ap-south-1c"
        }
    }
  
}



variable "postgress_port" {
    type = number
    default = 5432
}

variable "cidr_list" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "instance_name" {
    type = list(string)
    default = [ "Web-server", "Api-server", "DB-server" ]
}

variable "isProd" {
    type = bool
    default = false
  
}

variable "env" {
    type = string
    default = "DEV"
  
}