# Managed By : CloudDrove
# Description : This Script is used to create AWS Secrets.
# Copyright @ CloudDrove. All Right Reserved.

locals {
  secrets = {
    for secret in var.secrets :
    coalesce(try(secret.name, null), try(secret.name_prefix, null)) => {
      name                    = try(secret.name, null)
      name_prefix             = try(secret.name_prefix, null)
      description             = try(secret.description, null)
      kms_key_id              = try(secret.kms_key_id, null)
      policy                  = try(secret.policy, null)
      recovery_window_in_days = try(secret.recovery_window_in_days, var.recovery_window_in_days)
      secret_string           = try(secret.secret_string, null) != null ? secret.secret_string : (try(secret.secret_key_value, null) != null ? jsonencode(secret.secret_key_value) : null)
      secret_binary           = try(secret.secret_string, null) == null ? try(secret.secret_binary, null) : null
      tags                    = try(secret.tags, {})
    }
  }
}

##-----------------------------------------------------------------------------
# Labels module called that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "1.3.1"

  name        = var.name
  environment = var.environment
  attributes  = var.attributes
  repository  = var.repository
  managedby   = var.managedby
  label_order = var.label_order
  extra_tags  = var.extra_tags
}

##-----------------------------------------------------------------------------
# Secret Key Main Resource
##-----------------------------------------------------------------------------
resource "aws_secretsmanager_secret" "main" {
  for_each = var.enabled ? local.secrets : {}

  name                    = each.value.name
  name_prefix             = each.value.name_prefix
  description             = each.value.description
  kms_key_id              = each.value.kms_key_id
  policy                  = each.value.policy
  recovery_window_in_days = each.value.recovery_window_in_days

  dynamic "replica" {
    for_each = var.replica
    content {
      kms_key_id = try(replica.value.kms_key_id, null)
      region     = try(replica.value.region, null)
    }
  }

  tags = merge(module.labels.tags, each.value.tags)
}

##-----------------------------------------------------------------------------
# Secret Key Version Resources
##-----------------------------------------------------------------------------
resource "aws_secretsmanager_secret_version" "sm-sv" {
  for_each = var.enabled && !var.unmanaged ? local.secrets : {}

  secret_id     = aws_secretsmanager_secret.main[each.key].id
  secret_string = each.value.secret_string
  secret_binary = each.value.secret_binary != null ? base64encode(each.value.secret_binary) : null

  depends_on = [aws_secretsmanager_secret.main]
}

resource "aws_secretsmanager_secret_version" "sm-svu" {
  for_each = var.enabled && var.unmanaged ? local.secrets : {}

  secret_id     = aws_secretsmanager_secret.main[each.key].id
  secret_string = each.value.secret_string
  secret_binary = each.value.secret_binary != null ? base64encode(each.value.secret_binary) : null

  depends_on = [aws_secretsmanager_secret.main]

  lifecycle {
    ignore_changes = [
      secret_string,
      secret_binary,
      version_stages,
    ]
  }
}

##-----------------------------------------------------------------------------
# Secret Key Rotation Resource
##-----------------------------------------------------------------------------
resource "aws_secretsmanager_secret_rotation" "main" {
  for_each = var.enabled && var.enable_rotation ? local.secrets : {}

  rotation_lambda_arn = var.rotation_lambda_arn
  secret_id           = aws_secretsmanager_secret.main[each.key].id

  dynamic "rotation_rules" {
    for_each = [var.rotation_rules]
    content {
      automatically_after_days = try(rotation_rules.value.automatically_after_days, null)
      duration                 = try(rotation_rules.value.duration, null)
      schedule_expression      = try(rotation_rules.value.schedule_expression, null)
    }
  }

  depends_on = [aws_secretsmanager_secret.main]
}

