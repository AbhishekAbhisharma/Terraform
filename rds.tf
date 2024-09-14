terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"  # Specify your desired AWS region
  profile = "default"     # Use the appropriate profile name from your AWS credentials file
}

resource "aws_db_instance" "my_database" {
  allocated_storage    = 20    # Storage allocated for the database (in GB)
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"  # Change instance class to a supported one for MySQL 5.7
  db_name              = "test"  # Renamed 'name' to 'db_name'
  username             = "admin"  # Master username for the database
  password             = "Password"  # Master password for the database

  # Optionally, configure the database to be publicly accessible
  publicly_accessible = false

  # Optionally, specify the subnet group and security group
  # subnet_group_name   = aws_db_subnet_group.my_subnet_group.name
  # vpc_security_group_ids = [aws_security_group.my_security_group.id]

  # Specify the DB parameter group, option group, and parameter
  # group_name           = aws_db_parameter_group.my_parameter_group.name
  # option_group_name    = aws_db_option_group.my_option_group.name
  # parameter_group_name = aws_db_parameter_group.my_parameter_group.name

  # Optionally, specify the backup retention period (in days)
  backup_retention_period = 1

  # Optionally, enable automatic backups
  # backup_window       = "07:00-09:00"
  # maintenance_window  = "Sun:00:00-Mon:00:00"
}

