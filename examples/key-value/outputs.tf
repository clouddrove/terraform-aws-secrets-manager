output "secret_ids" {
  value       = module.secrets_manager[*].secret_ids
  description = "Secret id list"
}

output "secret_arns" {
  value       = module.secrets_manager[*].secret_arns
  description = "Secret arn list"
}
