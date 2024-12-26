# Global variable set
resource "tfe_variable_set" "azure_auth" {
  name         = "TFC_SETUP"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.tfc_organization_name
}

resource "tfe_variable" "global_vars" {
  for_each        = local.global_variable_set
  key             = each.key
  value           = each.value.value
  category        = try(each.value.category, "env")
  description     = try(each.value.description, "")
  variable_set_id = tfe_variable_set.azure_auth.id
}