terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"  # If you're using a named profile, otherwise remove this line
}

resource "aws_instance" "EC2" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  key_name      = "mumbai"
}

output "instances" {
  value       = aws_instance.EC2.public_ip
  description = "EC2 details"
}

