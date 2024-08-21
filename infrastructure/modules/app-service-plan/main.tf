resource "azurerm_service_plan" "appserviceplan" {

  name                = var.names.app-service-plan
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = var.os_type
  sku_name = var.sku_name

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }

}

resource "azurerm_app_service" "appservice" {
  name                = var.names.app-service
  resource_group_name = var.resource_group_name
  location            = var.location

  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
}
