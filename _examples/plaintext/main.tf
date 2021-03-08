provider "aws" {
  region = "eu-west-1"
}

module "secrets_manager" {

  source      = "../../"
  name        = "secrets-manager"
  environment = "test"
  label_order = ["name", "environment"]

  secrets = [
    {
      name                    = "secret-1"
      description             = "My secret 1"
      recovery_window_in_days = 7
      secret_string           = "This is an example"
    },
    {
      name                    = "secret-2"
      description             = "My secret 2"
      recovery_window_in_days = 7
      secret_string           = "This is another example"
    }
  ]
}

