variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "EC2 instance type for each environment"
  type        = map(string)
  default     = {
    dev        = "t3.micro"
    staging    = "t3.small"
    production = "t3.medium"
  }
}

variable "instance_name" {
  type    = string
  default = "my-first-ec2"
}

variable "security_group_name" {
  description = "Security group name per workspace"
  type        = map(string)
  default = {
    dev     = "my-instance-sg-east1-dev"
    staging = "my-instance-sg-east1-staging"
    production = "my-instance-sg-east1-prod"
  }
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
              nohup busybox httpd -f -p 8080 &
              EOF
}

