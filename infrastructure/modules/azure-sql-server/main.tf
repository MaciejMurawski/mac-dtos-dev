
data "azuread_group" "sql_admin_group" {
  display_name = var.sql_adm_group_name
}

resource "azurerm_mssql_server" "sqlserver" {
  name                = var.names.sql-server
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = var.sqlversion
  #administrator_login          = azurerm_key_vault_secret.sqllogin.value
  #administrator_login_password = azurerm_key_vault_secret.sqlpass.value
  minimum_tls_version = var.tlsver

  tags = var.tags

  azuread_administrator {
    azuread_authentication_only = var.ad_auth_only # set to: true
    login_username              = data.azuread_group.sql_admin_group.display_name
    object_id                   = data.azuread_group.sql_admin_group.object_id
  }

  # identity {
  #   type         = "UserAssigned"
  #   # identity_ids = [azurerm_user_assigned_identity.uai-sql.id]
  # }

  # primary_user_assigned_identity_id = azurerm_user_assigned_identity.uai-sql.id

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_mssql_firewall_rule" "azurepassthrough" {

  count = var.azurepassthrough ? 1 : 0

  name             = var.fw_rule_name
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = var.start_ip
  end_ip_address   = var.end_ip
}
