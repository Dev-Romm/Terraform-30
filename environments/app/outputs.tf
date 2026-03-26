output "app_instance_id" {
  value = aws_instance.app.id
}

output "networked_vpc" {
  value = data.terraform_remote_state.dev_network.outputs.vpc_id
}
