output "secret_ids" {
  value       = module.secrets_manager.secret_ids
  description = "Map of secret name to secret ID."
}

output "secret_arns" {
  value       = module.secrets_manager.secret_arns
  description = "Map of secret name to secret ARN."
}

output "version_ids" {
  value       = module.secrets_manager.version_ids
  description = "Map of secret name to secret version ID."
}
