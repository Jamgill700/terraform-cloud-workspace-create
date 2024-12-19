terraform {
  required_version = ">= 1.7.1"
  cloud {
    organization = "jg-xyz"

    workspaces {
      name = "terraform-cloud-workspace-create"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

}
 