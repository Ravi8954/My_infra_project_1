data "azurerm_subnet" "subnets" {
for_each = var.app_gateways
name                 = each.value.subnet_name
virtual_network_name = each.value.v_net_name
resource_group_name  = each.value.rg_name
}
data "azurerm_public_ip" "pips" {
for_each = var.app_gateways
name = each.value.pip_name
resource_group_name = each.value.rg_name
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "v_net-beap"
  frontend_port_name             = "v_net-feport"
  frontend_ip_configuration_name = "v_net-feip"
  http_setting_name              = "v_net-be-htst"
  listener_name                  = "v_net-httplstn"
  request_routing_rule_name      = "v_net-rqrt"
  redirect_configuration_name    = "v_net-rdrcfg"
}

resource "azurerm_application_gateway" "app_gateway" {
for_each = var.app_gateways
  name                = each.value.app_gateway_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.subnets[each.key].id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}