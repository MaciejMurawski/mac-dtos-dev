resource "azurerm_container_registry" "acr" {
  name                = var.names.azure-container-registry #"containerRegistry1"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled #false

  # georeplications {
  #   location                = "East US"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
}
