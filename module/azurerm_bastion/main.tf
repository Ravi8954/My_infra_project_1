data "azurerm_subnet" "subnets" {
for_each = var.bastion
name                 = each.value.subnet_name
virtual_network_name = each.value.v_net_name
resource_group_name  = each.value.rg_name
}  
data "azurerm_public_ip" "pips" {
for_each = var.bastion
name = each.value.pip_name
resource_group_name = each.value.rg_name
}
resource "azurerm_bastion_host" "bastion" {
for_each = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }
}