
resource "azurerm_linux_function_app" "function" {
  for_each = var.function_app

  name                = "${var.names.function-app}-${lower(each.value.name_suffix)}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.asp_id

  storage_account_name       = var.sa_name
  storage_account_access_key = var.sa_prm_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet-isolated"
  }

  dynamic "site_config" {
    for_each = var.site_config

    content {
      application_insights_connection_string = var.ai_connstring
      use_32_bit_worker                      = var.worker_32bit
      application_stack {
        use_dotnet_isolated_runtime = lookup(site_config.value, "dotnet_isolated_runtime", true)
        dotnet_version              = lookup(site_config.value, "dotnet_version", "8.0")
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [tags, app_settings, connection_string]
  }

}
