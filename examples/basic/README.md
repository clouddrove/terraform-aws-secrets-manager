# terraform-aws-secrets-manager basic example

This is a basic example of the `terraform-aws-secrets-manager` module.

## Usage

```hcl
module "secrets_manager" {
  source      = "clouddrove/secrets-manager/aws"
  name        = "secrets-manager"
  environment = "test"
}
```
