data "azuread_application" "app_permissions" {
  display_name = "jg-sp-001"
}

output "jg_sp_001_app_obj_id" {
  value = data.azuread_application.app_permissions.client_id
}

resource "azuread_application" "ws_creator" {
  display_name = "ws-creator"
}

resource "azuread_service_principal" "ws_creator" {
  client_id = azuread_application.ws_creator.client_id
}

resource "azurerm_role_assignment" "tfc_role_assignment" {
  scope                = "/subscriptions/${var.sub_id}"
  principal_id         = azuread_service_principal.ws_creator.object_id
  role_definition_name = "Contributor"
}

resource "azuread_application_federated_identity_credential" "tfc_ws_creator_plan" {
  application_id = azuread_application.ws_creator.id
  display_name   = "ws-creator-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  subject        = "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:plan"
}

resource "azuread_application_federated_identity_credential" "tfc_ws_creator_apply" {
  application_id = azuread_application.ws_creator.id
  display_name   = "ws-creator-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  subject        = "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:apply"
}