# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-rommy"
    key            = "workspace-environments/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}


resource "aws_instance" "firstec2" {
  ami                    = var.ami
  instance_type          = var.instance_type[terraform.workspace]
  vpc_security_group_ids = [aws_security_group.secgroup.id]

  user_data = var.user_data_script

  user_data_replace_on_change = true

  tags = {
    Name        = "web-${terraform.workspace}"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_security_group" "secgroup" {
  name = var.security_group_name[terraform.workspace]

  ingress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
}
