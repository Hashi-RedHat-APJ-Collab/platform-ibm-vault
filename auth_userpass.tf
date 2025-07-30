# auth_userpass.tf

# Reference existing userpass auth backend
data "vault_auth_backend" "userpass" {
  path = "userpass"
}

# Create userpass user
resource "vault_generic_secret" "user1" {
  path = "auth/${data.vault_auth_backend.userpass.path}/users/watsonxeng"
  
  data_json = jsonencode({
    password = var.watsonxeng_password
    policies = "ibm-admin"
  })
}                   