resource "aws_instance" "ec2"{
  ami           = "ami-072ec8f4ea4a6f2cf" 
  instance_type = "t2.micro"
}