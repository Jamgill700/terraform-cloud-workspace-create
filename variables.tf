variable "tfc_org" {
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

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}