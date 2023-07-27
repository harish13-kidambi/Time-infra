locals {
  instance_tenancy = "default"
  Public_subnet_length = length(var.pub_cidrs)
  current_time = timestamp()
  ami_id = data.aws_ami.ami_id.id
}