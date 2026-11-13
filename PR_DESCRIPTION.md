## Summary

Refactored module from `count` to `for_each` for stable resource addressing.
Secret names and values are **not changing** — only Terraform state addresses change.

---

## ⚠️ State Migration Required (run before apply)

For each existing secret, run `terraform state mv` to remap addresses:

```bash
# Replace [0], [1]... with actual index and "secret-name" with the secret's name value

terraform state mv \
  'module.<YOUR_MODULE_NAME>.aws_secretsmanager_secret.main[0]' \
  'module.<YOUR_MODULE_NAME>.aws_secretsmanager_secret.main["<secret-name>"]'

terraform state mv \
  'module.<YOUR_MODULE_NAME>.aws_secretsmanager_secret_version.sm-sv[0]' \
  'module.<YOUR_MODULE_NAME>.aws_secretsmanager_secret_version.sm-sv["<secret-name>"]'

# Repeat for each secret (increment index [1], [2]...)
```

**After state mv, `terraform plan` should show no changes.**

---

## Verification (before & after)

```bash
# Before: note existing secret names
aws secretsmanager list-secrets --query 'SecretList[].Name'

# Run state mv commands above

# After apply: verify same secret names exist
aws secretsmanager list-secrets --query 'SecretList[].Name'
```
