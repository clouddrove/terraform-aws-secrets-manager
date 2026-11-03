provider "aws" {
  region = "us-east-1"
}

module "secrets_manager" {
  source      = "../../"
  name        = "secrets-manager"
  environment = "test"

  secrets = [
    {
      name                    = "secret-basic"
      description             = "A basic plaintext secret"
      secret_string           = "my-super-secret-value"
      recovery_window_in_days = 7
    }
  ]
}
