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
      name                    = "secret-11"
      description             = "My secret 1"
      recovery_window_in_days = 7
      secret_string           = "This is an example"
    },
    {
      name                    = "secret-12"
      description             = "My secret 2"
      recovery_window_in_days = 7
      secret_string           = "This is another example"
    }
  ]
}
