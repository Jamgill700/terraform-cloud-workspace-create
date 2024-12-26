data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

provider "azurerm" {
  features {}
  subscription_id = var.sub_id
}

provider "tfe" {
  hostname = var.tfc_hostname
}

provider "azuread" {
  tenant_id     = data.azurerm_client_config.current.tenant_id
  client_id     = var.oidc_client_id
  client_secret = var.oidc_client_secret
}
