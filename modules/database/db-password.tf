resource "random_password" "db" {
  length  = 32
  special = true
  # RDS forbids a few characters in the master password; exclude them
  override_special = "!#$%&*()-_=+[]{}<>:?"
}