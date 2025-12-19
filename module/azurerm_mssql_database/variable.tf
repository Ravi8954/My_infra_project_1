variable "mssql_databases" {
type = map(object({
  mssql_database_name         = string
  mssql_server_name = string
  rg_name = string
  collation    = string
  license_type = string
  max_size_gb  = number
  sku_name     = string
  enclave_type = string
    }))
}