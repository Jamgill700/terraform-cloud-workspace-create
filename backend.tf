terraform {
  backend "cloud" {
    hostname     = var.tfc_hostname
    organization = var.tfc_org

    workspaces {
      name = "terraform-cloud-workspace-create"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

}