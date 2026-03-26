data "terraform_remote_state" "dev_network" {
  backend = "s3"
  config = {
    bucket = "terraform-up-and-running-state-rommy"
    key    = "environments/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.dev_network.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.dev_network.outputs.security_group_id]

  user_data = "#!/bin/bash\necho 'App started' > /tmp/app.txt"

  tags = {
    Name = "app-instance"
  }
}
