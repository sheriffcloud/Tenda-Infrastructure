terraform {
  backend "s3" {
    bucket       = "tenda-terraform-state-535002884759"
    key          = "tenda/production/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}