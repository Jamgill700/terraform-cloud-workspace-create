data "azurerm_client_config" "current" {}
data "azuread_client_config" "subscription" {}

provider "azurerm" {
  features {}
  subscription_id = var.sub_id
}

provider "tfe" {
  hostname = var.tfc_hostname
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = "5a18a8ef-3037-46d1-9cc0-b324b8723f67"
  client_secret = var.oidc_client_secret
}