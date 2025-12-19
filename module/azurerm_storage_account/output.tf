output "stg_id" {
  value = {
    for k, stg in azurerm_storage_account.stgs :
    k => stg.id
  }
}
