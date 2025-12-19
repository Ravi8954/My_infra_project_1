module "azurerm_resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_network"
  v_nets     = var.v_nets
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_public_ip"
  pips       = var.pips
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../module/azurerm_compute"
  v_nets     = var.v_nets
  vms        = var.vms
}

module "azurerm_mssql_server" {
  depends_on   = [module.azurerm_resource_group]
  source       = "../../module/azurerm_mssql_server"
  mssqlservers = var.mssqlservers
}

module "azurerm_mssql_database" {
  depends_on      = [module.azurerm_mssql_server]
  source          = "../../module/azurerm_mssql_database"
  mssql_databases = var.mssql_databases
}

module "azurerm_bastion" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../module/azurerm_bastion"
  bastion    = var.bastion
}

module "azurerm_lb" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_lb"
  lbs        = var.lbs
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_keyvault"
  key_vaults = var.key_vaults
}

module "azurerm_application_gateway" {
  depends_on   = [module.azurerm_virtual_machine]
  source       = "../../module/azurerm_application_gateway"
  app_gateways = var.app_gateways
}

module "azurerm_key_vault_secret" {
  depends_on = [module.azurerm_key_vault]
  source     = "../../module/azurerm_keyvault_secret"
  secrets    = var.secrets
}