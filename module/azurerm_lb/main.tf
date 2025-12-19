data "azurerm_public_ip" "pips" {
for_each = var.lbs
name = each.value.pip_name
resource_group_name = each.value.rg_name
}
resource "azurerm_lb" "lb" {
for_each = var.lbs
name                = each.value.lb_name
location            = each.value.location
resource_group_name = each.value.rg_name

frontend_ip_configuration {
name                 = "PublicIPAddresslb"
public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
}
}