output "app_sg_id" {
  value = aws_security_group.app_sg.id
}
output "role_name" {
  value = aws_iam_instance_profile.ecr_s3_instance_profile.name
}