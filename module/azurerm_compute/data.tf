data "azurerm_subnet" "subnets" {
for_each = var.vms
name                 = each.value.subnet_name
virtual_network_name = each.value.v_net_name
resource_group_name  = each.value.rg_name
}
data "azurerm_public_ip" "pips" {
for_each = var.vms
name = each.value.pip_name
resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  key_vault_id = data.azurerm_key_vault.current.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.current.id
}

data "azurerm_key_vault" "current" {
  name = "rkpkeyvault"
  resource_group_name = "rkprg1"
}