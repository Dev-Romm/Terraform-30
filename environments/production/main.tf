provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "firstec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.secgroup.id]

  user_data = var.user_data_script

  user_data_replace_on_change = true

  tags = {
    Name        = "web-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_security_group" "secgroup" {
  name = var.security_group_name

  ingress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
}
