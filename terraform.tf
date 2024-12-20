terraform {
  required_version = ">= 1.7"

  #   backend "cloud" {
  #     hostname     = "app.terraform.io"
  #     organization = "jg-xyz"

  #     workspaces {
  #       name = "terraform-cloud-workspace-create"
  #     }
  #   }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }

}