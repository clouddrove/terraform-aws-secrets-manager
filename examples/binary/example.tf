provider "aws" {
  region = local.region
}

locals {
  region      = "eu-west-1"
  name        = "secrets_manager"
  environment = "test"
}

module "secrets_manager" {
  source      = "../../"
  name        = local.name
  environment = local.environment

  secrets = [
    {
      name          = "secret-binary-1"
      description   = "This is a binary secret"
      secret_binary = "<base64-encoded-binary-or-ssh-key>"
    },
    {
      name                    = "secret-binary-2"
      description             = "Another binary secret"
      secret_binary           = "<base64-encoded-binary-or-ssh-key>"
      recovery_window_in_days = 7
    }
  ]
}
