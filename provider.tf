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
  tenant_id     = data.azurerm_client_config.current
  client_id     = data.azuread_application.app_permissions.client_id
  client_secret = var.oidc_client_secret
}