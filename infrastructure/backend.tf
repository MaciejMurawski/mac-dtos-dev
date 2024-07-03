
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dtos-state"
    storage_account_name = "samacdtosdevstate"
    container_name       = "tfstate"
    key                  = "dev.dtos.tfstate"
  }
}
