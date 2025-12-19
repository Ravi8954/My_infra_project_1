data "azurerm_key_vault" "kv" {
  for_each = var.secrets
  name = each.value.kv_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_key_vault_secret" "secret" {
  for_each = var.secrets
  name         = each.value.admin_username   
  value = each.value.admin_password
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}