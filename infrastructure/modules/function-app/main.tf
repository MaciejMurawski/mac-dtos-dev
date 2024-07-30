
resource "azurerm_linux_function_app" "function" {
  for_each = var.function_app

  name                = "${var.names.function-app}-${lower(each.value.name_suffix)}-mac"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.asp_id

  storage_account_name       = var.sa_name
  storage_account_access_key = var.sa_prm_key

  site_config {
    application_insights_connection_string = var.ai_connstring
    use_32_bit_worker                      = var.gl_worker_32bit

    application_stack {
      use_dotnet_isolated_runtime = var.gl_dotnet_isolated
      dotnet_version              = var.gl_dotnet_version
    }
  }

  app_settings = local.app_settings[each.key]
  tags         = var.tags

  lifecycle {
    ignore_changes = [tags, connection_string]
  }

}

# data "azurerm_function_app_host_keys" "fnapphostkey" {
#   for_each = azurerm_linux_function_app.function

#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name

#   #depends_on = [azurerm_function_app.example]
# }
