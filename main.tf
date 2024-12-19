# resource "tfe_organization" "main" {
#   name  = var.tfc_org
#   email = var.tfc_email
# }

# resource "tfe_project" "ws_creator" {
#   organization = tfe_organization.main.name
#   name         = "azure-modules"
# }

# resource "tfe_workspace" "azure_modules" {
#   for_each     = local.azure_module_ws
#   name         = each.value.name
#   organization = tfe_organization.main.name
#   tag_names    = ["modules", ]
# }

resource "tfe_workspace" "ws_creator" {
  name         = "terraform-cloud-workspace-create"
  organization = var.tfc_org
  tag_names    = ["workspaces", ]
}

output "workspace_id" {
  value = tfe_workspace.ws_creator.id
}

# variable set
resource "tfe_variable_set" "azure_auth" {
  name         = "TFC_AZURE_PROVIDER_AUTH"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.tfc_org
}

resource "tfe_variable" "azure_auth" {
  key             = "TFC_AZURE_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "Enable the Workload Identity integration for Azure."
  variable_set_id = tfe_variable_set.azure_auth.id
}


# individual workspace variable
# resource "tfe_variable" "tfc_azure_client_id" {
#   description  = "The Azure Client ID the workspace will use to authenticate with Azure."
#   workspace_id = tfe_workspace.ws_creator.id
#   key          = "TFC_AZURE_RUN_CLIENT_ID"
#   value        = azuread_application.ws_creator.client_id
#   category     = "env"
# }