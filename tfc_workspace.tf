# project
resource "tfe_project" "ws_creator" {
  organization = var.tfc_organization_name
  name         = var.tfc_project_name
}

# workspace
resource "tfe_workspace" "ws_creator" {
  name         = var.tfc_workspace_name
  organization = var.tfc_organization_name
  vcs_repo {
    identifier     = var.vcs_repo_id
    branch         = var.vcs_branch
    oauth_token_id = tfe_oauth_client.ws_creator.oauth_token_id
  }
}

# workspace settings
resource "tfe_workspace_settings" "ws_creator" {
  workspace_id   = tfe_workspace.ws_creator.id
  execution_mode = "remote"
}

# workspace id output
output "workspace_id" {
  value = tfe_workspace.ws_creator.id
}

# ws-creator workspace variable
resource "tfe_variable" "tfc_azure_client_id" {
  description  = "The Azure Client ID the workspace will use to authenticate with Azure."
  workspace_id = tfe_workspace.ws_creator.id
  key          = "TFC_AZURE_RUN_CLIENT_ID"
  value        = azuread_application.ws_creator.client_id
  category     = "env"
}

resource "tfe_variable" "env_vars" {
  for_each     = local.variable_set
  workspace_id = tfe_workspace.ws_creator.id
  key          = each.key
  value        = each.value.value
  category     = "terraform"
  sensitive    = true
}