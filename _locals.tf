locals {

  # workspace global variables
  global_variable_set = {
    TFC_AZURE_PROVIDER_AUTH = {
      value       = "true"
      description = "Enable the Workload Identity integration for Azure."
    },
    tfc_organization_name = {
      value = "jg-xyz"
    },
    tfc_hostname = {
      value = "app.terraform.io"
    },
  }

  # used to create variables on a workspace
  variable_set = {
    sub_id                = { value = var.sub_id },
    tfc_organization_name = { value = var.tfc_organization_name },
    tfc_project_name      = { value = var.tfc_project_name },
    tfc_email             = { value = var.tfc_email },
    vcs_repo_id           = { value = var.vcs_repo_id },
    tfc_workspace_name    = { value = var.tfc_workspace_name },
    vcs_oauth_token_id    = { value = var.vcs_oauth_token_id },
    oidc_client_id        = { value = var.oidc_client_id },
    oidc_client_secret    = { value = var.oidc_client_secret }
  }

  # used to create the workspace
  azure_modules = {
    storage-account = {
      branch = "master"
    },
    resource-group-tf = {
      branch = "master"
    },
  }


}