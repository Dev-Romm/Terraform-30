variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "instance_name" {
  type    = string
  default = "my-first-ec2"
}

variable "security_group_name" {
  type    = string
  default = "my-instance-sg-east1-production"
}

variable "port_number" {
  type    = number
  default = 8080
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "user_data_script" {
  type    = string
  default = <<-EOF
#!/bin/bash
 echo "Hello, World" > index.html
EOF
}
