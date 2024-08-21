terraform {
  required_version = ">= 1.9.2"
  required_providers {
    azurerm = "= 3.112.0"
    random  = "~> 3.5.1"
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.53.1"
    }
  }
}

provider "azurerm" {

  features {}
}

# provider "azurerm" {
#   alias = "audit"
#   subscription_id = "458925b3-1fcc-436c-a5cd-f9419dda2537" # var.AUDIT_SUBSCRIPTION_ID
#   # Configuration options

#   features {}
# }

provider "azuread" {
  # Configuration options
}

module "config" {
  source      = ".//modules/shared-config"
  location    = var.location
  application = var.application
  env         = var.environment
  tags        = var.tags
}
