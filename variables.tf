#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-secrets-manager"
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'"
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the vpc creation."
}

variable "recovery_window_in_days" {
  description = "Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days."
  type        = number
  default     = 30
}

# Secrets
variable "secrets" {
  description = "List of secrets to keep in AWS Secrets Manager"
  type        = any
  default     = []
  sensitive   = true
}

variable "unmanaged" {
  description = "Terraform must ignore secrets lifecycle. Using this option you can initialize the secrets and rotate them outside Terraform, thus, avoiding other users to change or rotate the secrets by subsequent runs of Terraform"
  type        = bool
  default     = false
}

################################################################################
# Secret Key Rotation Resource
################################################################################

variable "enable_rotation" {
  description = "Determines whether secret rotation is enabled"
  type        = bool
  default     = false
}

variable "rotation_lambda_arn" {
  description = "Specifies the ARN of the Lambda function that can rotate the secret"
  type        = string
  default     = ""
}

variable "rotation_rules" {
  description = "A structure that defines the rotation configuration for this secret"
  type        = map(any)
  default     = {}
}

variable "replica" {
  description = "Configuration block to support secret replication"
  type        = map(any)
  default     = {}
}