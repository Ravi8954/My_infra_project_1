variable "rgs" {
  type = map(object(
    {
      name       = string
      location   = string
      managed_by = optional(string)
  }))
}

variable "v_nets" {
  type = map(object(
    {
      v_net_name    = string
      location      = string
      rg_name       = string
      address_space = list(string)
      subnets = map(object({
        subnet_name      = string
        address_prefixes = list(string)
      }))

  }))
}

variable "pips" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}
variable "vms" {
  type = map(object({
    nic_name       = string
    location       = string
    rg_name        = string
    subnet_name    = string
    v_net_name     = string
    pip_name       = string
    vm_name        = string
    vm_size        = string
    admin_username = string
    admin_password = string
  }))
}

variable "mssqlservers" {
  type = map(object({
    mssqlserver_name             = string
    rg_name                      = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "mssql_databases" {
  type = map(object({
    mssql_database_name = string
    mssql_server_name   = string
    rg_name             = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
  }))
}

variable "bastion" {}
variable "lbs" {}
variable "key_vaults" {}
variable "app_gateways" {}
variable "secrets" {}