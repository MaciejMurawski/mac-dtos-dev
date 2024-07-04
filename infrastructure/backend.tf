
terraform {
  backend "azurerm" {

    # My DToS dev env
    resource_group_name  = var.STATE_RG # "rg-dtos-state"
    storage_account_name = var.STATE_SA
    container_name       = var.STATE_CONT
    key                  = var.STATE_BLOB
  }
}
