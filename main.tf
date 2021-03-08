# Managed By : CloudDrove
# Description : This Script is used to create AWS Secrets.
# Copyright @ CloudDrove. All Right Reserved.


locals {

  secrets = [
    for secret in var.secrets : {
      name                    = lookup(secret, "name", null)
      name_prefix             = lookup(secret, "name_prefix", null)
      description             = lookup(secret, "description", null)
      kms_key_id              = lookup(secret, "kms_key_id", null)
      policy                  = lookup(secret, "policy", null)
      recovery_window_in_days = lookup(secret, "recovery_window_in_days", var.recovery_window_in_days)
      secret_string           = lookup(secret, "secret_string", null) != null ? lookup(secret, "secret_string") : (lookup(secret, "secret_key_value", null) != null ? jsonencode(lookup(secret, "secret_key_value", {})) : null)
      secret_binary           = lookup(secret, "secret_string", null) == null ? lookup(secret, "secret_binary", null) : null
      tags                    = lookup(secret, "tags", {})
    }
  ]
}


#Module      : Label
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/clouddrove/terraform-labels.git?ref=tags/0.14.0"

  name        = var.name
  environment = var.environment
  attributes  = var.attributes
  repository  = var.repository
  managedby   = var.managedby
  label_order = var.label_order
}

resource "aws_secretsmanager_secret" "main" {
  count                   = length(local.secrets)
  name                    = lookup(element(local.secrets, count.index), "name")
  name_prefix             = lookup(element(local.secrets, count.index), "name_prefix")
  description             = lookup(element(local.secrets, count.index), "description")
  kms_key_id              = lookup(element(local.secrets, count.index), "kms_key_id")
  policy                  = lookup(element(local.secrets, count.index), "policy")
  recovery_window_in_days = lookup(element(local.secrets, count.index), "recovery_window_in_days")

  tags = module.labels.tags
}

resource "aws_secretsmanager_secret_version" "sm-sv" {
  count         = var.unmanaged ? 0 : length(local.secrets)
  secret_id     = aws_secretsmanager_secret.main.*.id[count.index]
  secret_string = lookup(element(local.secrets, count.index), "secret_string")
  secret_binary = lookup(element(local.secrets, count.index), "secret_binary") != null ? base64encode(lookup(element(local.secrets, count.index), "secret_binary")) : null
  depends_on    = [aws_secretsmanager_secret.main]
}

resource "aws_secretsmanager_secret_version" "sm-svu" {
  count         = var.unmanaged ? length(local.secrets) : 0
  secret_id     = aws_secretsmanager_secret.main.*.id[count.index]
  secret_string = lookup(element(local.secrets, count.index), "secret_string")
  secret_binary = lookup(element(local.secrets, count.index), "secret_binary") != null ? base64encode(lookup(element(local.secrets, count.index), "secret_binary")) : null
  depends_on    = [aws_secretsmanager_secret.main]

  lifecycle {
    ignore_changes = [
      secret_string,
      secret_binary,
    ]
  }
}
