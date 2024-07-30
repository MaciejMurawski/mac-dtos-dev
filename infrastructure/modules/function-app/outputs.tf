
output "function_app_hostname" {
  description = "The default hostnames of the deployed Linux Function Apps."
  value       = { for k, function in azurerm_linux_function_app.function : k => function.default_hostname }
}

output "function_app_url" {
  description = "Composed URL of the deployed Linux Function Apps."
  value       = { for k, function in azurerm_linux_function_app.function : k => "https://${function.default_hostname}/api/?code=${data.azurerm_function_app_host_keys.fnapphostkey[each.key]}" }
    #for k, function in azurerm_linux_function_app.function : k => "https://${function.default_hostname}/api/${local.function_foo}?code=${data.azurerm_function_app_host_keys.fnapphostkey.default_function_key}"
}
