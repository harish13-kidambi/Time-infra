terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.9.0"
    }
  }

  backend "s3" {
      bucket = "terraform-docker-kub8-resource"
      key    = "loops"
      dynamodb_table = "Terraform-lock"
      region = "ap-south-1"
      encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

