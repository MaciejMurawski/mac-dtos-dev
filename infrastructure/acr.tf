module "acr" {
  source = ".//modules/azure-container-registry"

  names = module.config.names

  resource_group_name = module.baseline.resource_group_names[var.acr.resource_group_key]
  location            = module.baseline.resource_group_locations[var.acr.resource_group_key]

  sku           = var.acr.sku
  admin_enabled = var.acr.admin_enabled
  tags          = var.tags

}
