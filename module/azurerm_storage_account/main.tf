# block wala arguments
# dynamic "network_rules" {
#     for_each ={}
#     content {
#     default_action    = var.default_action
#     bypass        = var.bypass_services
#     virtual_network_subnet_ids = var.subnet_ids
# }
# }
resource "azurerm_storage_account" "stg" {
for_each = var.stgs # variable is place holders 
name = each.value.name
location =each.value.location
resource_group_name = each.value.resource_group_name
account_tier = each.value.account_tier
account_replication_type = each.value.account_replication_type
account_kind = each.value.account_kind  # Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage
cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
access_tier = each.value.access_tier
# enable_https_traffic_only = each.value.enable_https_traffic_only        # Recommended to force HTTPS
is_hns_enabled           = each.value.is_hns_enabled                               # Hierarchical namespace (for Data Lake Gen2)
min_tls_version          = each.value.min_tls_version                           # Optional: TLS1_0, TLS1_1, TLS1_2
# allow_blob_public_access = each.value.allow_blob_public_access    # Default is true
# enable_blob_encryption   = each.value.enable_blob_encryption                               # Default true
# enable_file_encryption   = each.value.enable_file_encryption                               # Default true
large_file_share_enabled = each.value.large_file_share_enabled                              # For large file shares
shared_access_key_enabled = each.value.shared_access_key_enabled                              # Default true, for using access keys
nfsv3_enabled             = each.value.nfsv3_enabled                             # For NFS 3.0 protocol support
# versioning_enabled = each.value.versioning_enabled
# change_feed_enabled = each.value.change_feed_enabled
# default_service_version = each.value.default_service_version  
}
