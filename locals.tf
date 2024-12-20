locals {

  azure_module_ws = {

  }

  variable_set = {
    sub_id                = { value = var.sub_id },
    tfc_organization_name = { value = var.tfc_organization_name },
    tfc_project_name      = { value = var.tfc_project_name },
    tfc_email             = { value = var.tfc_email },
    vcs_repo_id           = { value = var.vcs_repo_id },
    tfc_workspace_name    = { value = var.tfc_workspace_name },
    vcs_oauth_token_id    = { value = var.vcs_oauth_token_id },
    oidc_client_id = {
      value    = var.oidc_client_id
      category = "env"
    },
    oidc_client_secret = {
      value    = var.oidc_client_secret
      category = "env"
    }

  }


}