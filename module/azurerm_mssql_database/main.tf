data "azurerm_mssql_server" "mssql_server" {
for_each = var.mssql_databases
  name                = each.value.mssql_server_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_mssql_database" "mssql_database" {
for_each = var.mssql_databases
  name         = each.value.mssql_database_name
  server_id    = data.azurerm_mssql_server.mssql_server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
}