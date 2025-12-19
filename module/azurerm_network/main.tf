resource "azurerm_virtual_network" "v_net" {
for_each = var.v_nets
name                = each.value.v_net_name
location            = each.value.location
resource_group_name = each.value.rg_name
address_space       = each.value.address_space

dynamic "subnet" {
for_each = each.value.subnets
content {
name             = subnet.value.subnet_name
address_prefixes = subnet.value.address_prefixes 
}
}
}