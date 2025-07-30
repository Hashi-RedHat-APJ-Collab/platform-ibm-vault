# auth_userpass.tf

data "vault_auth_backend" "name" {
    path = "userpass"
}

# userpass auth method
resource "vault_userpass_auth_backend_user" "user1" {
  backend = vault_auth_backend.userpass.path
  username = "watsonxeng"
  password = var.watsonxeng_password
  policies = ["ibm-admin"]
}                   