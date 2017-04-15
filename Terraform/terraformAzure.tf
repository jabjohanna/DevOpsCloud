provider "azurerm" {
  subscription_id = "0b21b73a-8183-4a66-a27b-71c94e83c1b8"
  client_id       = "78a17fd6-2829-4e52-8629-f49ec455fb32"
  client_secret   = "ktJoZtOYmQMv1EcZ3WucuarxClWjKTSbwyrkLQuLhfk="
  tenant_id       = "c79426fb-7d92-4758-9508-d26615643114"
}

# Create a resource group
resource "azurerm_resource_group" "jabTestTerraform" {
  name     = "jabTestTerraform"
  location = "West US"
}
