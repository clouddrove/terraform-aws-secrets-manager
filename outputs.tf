output "secret_ids" {
  value       = { for k, v in aws_secretsmanager_secret.main : k => v.id }
  description = "Map of secret name to secret ID."
}

output "secret_arns" {
  value       = { for k, v in aws_secretsmanager_secret.main : k => v.arn }
  description = "Map of secret name to secret ARN."
}

output "version_ids" {
  value       = { for k, v in aws_secretsmanager_secret_version.sm-sv : k => v.version_id }
  description = "Map of secret name to the unique identifier of the secret version."
  sensitive   = true
}
