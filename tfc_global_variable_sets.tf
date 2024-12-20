# Global variable set
resource "tfe_variable_set" "azure_auth" {
  name         = "TFC_AZURE_PROVIDER_AUTH"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.tfc_organization_name
}

resource "tfe_variable" "azure_auth" {
  key             = "TFC_AZURE_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "Enable the Workload Identity integration for Azure."
  variable_set_id = tfe_variable_set.azure_auth.id
}