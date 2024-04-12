provider "aws" {
  region = local.region
}

locals {
  region      = "eu-west-1"
  name        = "secrets_manager"
  environment = "test"
}

module "secrets_manager" {
  source = "../../"

  name        = local.name
  environment = local.environment
  secrets = [
    {
      name        = "secret-kv-1"
      description = "This is a key/value secret"
      secret_key_value = {
        key1  = "value1"
        key2  = "value2"
        key3  = "value2"
        key4  = "value2"
        key5  = "value2"
        key6  = "value2"
        key7  = "value2"
        key8  = "value2"
        key89 = "value2"

      }
      recovery_window_in_days = 7
    },
    {
      name        = "secret-kv-2"
      description = "Another key/value secret"
      secret_key_value = {
        username = "user"
        password = "topsecret"
      }
      recovery_window_in_days = 7
    },
  ]
}
