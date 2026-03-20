provider "aws" {
  region = "us-east-1"
}

module "secrets_manager" {
  source      = "../../"
  name        = "secrets-manager"
  environment = "test"
}
