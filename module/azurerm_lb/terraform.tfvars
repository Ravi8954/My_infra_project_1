lbs = {
lb_name                = "TestLoadBalancer"
location            = "eastus"
rg_name = "rkprg1"
frontend_ip_configuration = {
name                 = "PublicIPAddress"
public_ip_address_id = azurerm_public_ip.example.id 
  }
}