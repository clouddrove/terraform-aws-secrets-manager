output "secret_ids" {
  value       = join("", aws_secretsmanager_secret.main[*].id)
  description = "Secret id list"
}

output "secret_arns" {
  value       = join("", aws_secretsmanager_secret.main[*].arn)
  description = "Secret arn list"
}

output "version_id" {
  value       = join("", aws_secretsmanager_secret.main[*].arn)
  description = "The unique identifier of the version of the secret."
}
