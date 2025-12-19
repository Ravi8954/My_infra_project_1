rgs = {
  rg1 = {
    name       = "rkprg1"
    location   = "eastus"
    managed_by = "terraform"
  }
}

v_nets = {
  v_net1 = {
    v_net_name    = "v_net_1"
    location      = "eastus"
    rg_name       = "rkprg1"
    address_space = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        subnet_name      = "frontendsubnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        subnet_name      = "backendsubnet" #AzureBastionSubnet
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet3 = {
        subnet_name      = "AzureBastionSubnet" #AzureBastionSubnet
        address_prefixes = ["10.0.3.0/24"]
      }
      subnet4 = {
        subnet_name      = "appl_gatway_subnet" #AzureBastionSubnet
        address_prefixes = ["10.0.4.0/24"]
      }

    }
  }
}
pips = {
  pip1 = {
    pip_name          = "rkpip1"
    rg_name           = "rkprg1"
    location          = "eastus"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "rkpip2"
    rg_name           = "rkprg1"
    location          = "eastus"
    allocation_method = "Static"
  }
  pip3 = {
    pip_name          = "rkpip3"
    rg_name           = "rkprg1"
    location          = "eastus"
    allocation_method = "Static"
  }
  pip4 = {
    pip_name          = "rkpip4"
    rg_name           = "rkprg1"
    location          = "eastus"
    allocation_method = "Static"
  }
}


vms = {
  vm1 = {
    nic_name       = "nic_1"
    location       = "eastus"
    rg_name        = "rkprg1"
    subnet_name    = "frontendsubnet"
    v_net_name     = "v_net_1"
    pip_name       = "rkpip1"
    vm_name        = "frontendvm"
    vm_size        = "Standard_B1s"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
}

mssqlservers = {
  mssqlserver1 = {
    mssqlserver_name             = "mssqlserver1"
    rg_name                      = "rkprg1"
    location                     = "eastus"
    version                      = "12.0"
    administrator_login          = "missadministrator"
    administrator_login_password = "thisIsKat11"
    minimum_tls_version          = "1.2"
  }
}
mssql_databases = {
  mssql_database1 = {
    mssql_database_name = "example-db"
    mssql_server_name   = "mssqlserver1"
    rg_name             = "rkprg1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
}
bastion = {
  bastion1 = {
    bastion_name = "rkpbastion"
    rg_name      = "rkprg1"
    subnet_name  = "AzureBastionSubnet"
    v_net_name   = "v_net_1"
    pip_name     = "rkpip2"
    location     = "eastus"
    rg_name      = "rkprg1"
  }
}
lbs = {
  lb1 = {
    lb_name  = "TestLoadBalancer"
    location = "eastus"
    rg_name  = "rkprg1"
    pip_name = "rkpip3"
  }
}

app_gateways = {
  app_gateway1 = {
    app_gateway_name = "rkpapp_gateway"
    v_net_name       = "v_net_1"
    subnet_name      = "appl_gatway_subnet"
    pip_name         = "rkpip4"
    rg_name          = "rkprg1"
    location         = "eastus"
  }
}

key_vaults = {
  key_vault1 = {
    key_vault_name              = "rkpkeyvault"
    location                    = "eastus"
    rg_name                     = "rkprg1"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

secrets = {
  secret1 = {
    kv_name        = "rkpkeyvault"
    rg_name        = "rkprg1"
    admin_username = "rkpadminuser"
    admin_password = "rkpadminuser@1992"
  }

  # secret1 ={
  #   kv_name = "rkpkeyvault"
  #   rg_name = "rkprg1"
  # admin_username = "rkpadminuser"
  # admin_password = "rkpadminuser@1992"
  # }
}