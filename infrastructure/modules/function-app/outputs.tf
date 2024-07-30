
# output "function_app_hostname" {
#   description = "The default hostnames of the deployed Linux Function Apps."
#   value       = { for k, function in azurerm_linux_function_app.function : k => function.default_hostname }
# }
