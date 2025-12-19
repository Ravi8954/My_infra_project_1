variable "stgs" {
type = map(objects(    #we can write map(map(strings)) if all value string
{
name = string
location = string
resource_group_name = string
account_tier = string
account_replication_type = string
account_kind = optional(string)
cross_tenant_replication_enabled = optional(bool,true)
access_tier = optional(string)
account_kind             = optional(string)                        # Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage
enable_https_traffic_only = optional(bool,false)                              # Recommended to force HTTPS
is_hns_enabled           = optional(bool,false)                               # Hierarchical namespace (for Data Lake Gen2)
min_tls_version          = optional(string)                           # Optional: TLS1_0, TLS1_1, TLS1_2
allow_blob_public_access = optional(bool,true)                              # Default is true
enable_blob_encryption   = optional(bool, true)                               # Default true
enable_file_encryption   = optional(bool, true)                               # Default true
large_file_share_enabled = optional(bool,false)                              # For large file shares
shared_access_key_enabled = optional(bool, true)                             # Default true, for using access keys
nfsv3_enabled             = optional(bool,false)                             # For NFS 3.0 protocol support
versioning_enabled = optional(bool, true)
change_feed_enabled = optional(bool, true)
default_service_version = optional(string)
}))
}