variable "tfc_organization_name" {
  description = "The terraform cloud organization"
  type        = string
}

variable "tfc_email" {
  description = "The email on the terraform cloud account"
  type        = string
}

variable "sub_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "oidc_client_id" {
  description = "workspace client id for app jg-sp-001"
  type        = string
}


variable "oidc_client_secret" {
  description = "workspace secret for app jg-sp-001"
  type        = string
  sensitive   = true
}

variable "tfc_hostname" {
  description = "The terraform cloud hostname"
  type        = string
  default     = "app.terraform.io"
}

variable "tfc_project_name" {
  description = "The terraform cloud project name"
  type        = string
}

variable "tfc_workspace_name" {
  description = "The terraform cloud workspace name"
  type        = string
}

variable "vcs_repo_id" {
  description = "The VCS repo ID"
  type        = string
}

variable "vcs_branch" {
  description = "The VCS branch"
  type        = string
  default     = "main"
}

variable "vcs_oauth_token_id" {
  description = "The VCS oauth token ID"
  type        = string
  sensitive   = true
}
