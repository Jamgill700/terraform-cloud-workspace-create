# global
resource "tfe_oauth_client" "ws_creator" {
  organization     = var.tfc_organization_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.vcs_oauth_token_id
  service_provider = "github"
}