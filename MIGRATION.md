# Migration Guide: count → for_each
#
# This module was refactored from count-based to for_each-based resource addressing.
# If you have existing resources deployed with a previous version of this module,
# you must add `moved` blocks in your ROOT module (not here) to prevent destroy/recreate.
#
# Example — add this in your root module's main.tf for each existing secret:
#
#   moved {
#     from = module.secrets_manager.aws_secretsmanager_secret.main[0]
#     to   = module.secrets_manager.aws_secretsmanager_secret.main["your-secret-name"]
#   }
#
#   moved {
#     from = module.secrets_manager.aws_secretsmanager_secret_version.sm-sv[0]
#     to   = module.secrets_manager.aws_secretsmanager_secret_version.sm-sv["your-secret-name"]
#   }
#
# Replace "your-secret-name" with the `name` field of each secret in your secrets list.
# Add one moved block per secret, incrementing the index [0], [1], [2]...
#
# After running `terraform apply` successfully, these moved blocks can be removed.
