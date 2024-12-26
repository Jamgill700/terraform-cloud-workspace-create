# project
resource "tfe_project" "azure_modules" {
  organization = var.tfc_organization_name
  name         = "azure-modules"
}

# workspace
resource "tfe_workspace" "azure_modules" {
  for_each     = local.azure_modules
  name         = "azurerm-${each.key}-module"
  organization = var.tfc_organization_name
  project_id   = tfe_project.azure_modules.id
  vcs_repo {
    identifier     = "Jamgill700/azurerm-${each.key}-module"
    branch         = try(each.value.branch, var.vcs_branch)
    oauth_token_id = tfe_oauth_client.ws_creator.oauth_token_id
  }
}

# workspace settings
resource "tfe_workspace_settings" "azure_modules" {
  for_each       = tfe_workspace.azure_modules
  workspace_id   = each.value.id
  execution_mode = "remote"
}

# workspace id output
output "azure_modules_workspace_ids" {
  value = { for k, v in tfe_workspace.azure_modules : k => v.id }
}

# ws-creator workspace variable
# resource "tfe_variable" "tfc_azure_client_id" {
#   for_each = local.azure_modules
#   description  = "The Azure Client ID the workspace will use to authenticate with Azure."
#   workspace_id = tfe_workspace.azure_modules.id
#   key          = "TFC_AZURE_RUN_CLIENT_ID"
#   value        = azuread_application.ws_creator.client_id
#   category     = "env"
# }

