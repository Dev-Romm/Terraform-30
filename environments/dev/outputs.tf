output "instance_id" {
  value = aws_instance.firstec2.id
}

output "security_group_id" {
  value = aws_security_group.secgroup.id
}
