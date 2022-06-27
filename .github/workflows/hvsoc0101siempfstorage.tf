# azurerm_storage_account.hvsoc0101siempfstorage:
resource "azurerm_storage_account" "hvsoc0101siempfstorage" {
    access_tier                    = "Hot"
    account_kind                   = "StorageV2"
    account_replication_type       = "LRS"
    account_tier                   = "Standard"
    allow_blob_public_access       = true
    enable_https_traffic_only      = true

    is_hns_enabled                 = false
    location                       = "japaneast"
    min_tls_version                = "TLS1_2"
    name                           = var.hvsoc0101siempfstorage_storage_account_name
    nfsv3_enabled                  = false
#    primary_access_key             = (sensitive value)
#    primary_blob_connection_string = (sensitive value)
#    primary_connection_string      = (sensitive value)
    queue_encryption_key_type      = "Service"
    resource_group_name            = var.resorcegroup_hvsoc_siempf_name
#    secondary_access_key           = (sensitive value)
#    secondary_connection_string    = (sensitive value)
    shared_access_key_enabled      = true
    table_encryption_key_type      = "Service"
    tags                           = {}

    blob_properties {
        change_feed_enabled      = false
        last_access_time_enabled = false
        versioning_enabled       = false

        container_delete_retention_policy {
            days = 7
        }

        delete_retention_policy {
            days = 7
        }
    }

    network_rules {
        bypass                     = [
            "AzureServices",
        ]
        default_action             = "Deny"
        ip_rules                   = [
            "13.76.218.0/24",
            "202.246.251.240/28",
            "202.246.252.128/25",
            "202.246.252.96/27",
            "40.65.186.0/24",
        ]
        virtual_network_subnet_ids = [
            azurerm_subnet.hvsoc_siempf_subnet-container-instances_Subnet.id
        ]
    }

#    queue_properties {
#        hour_metrics {
#            enabled               = true
#            include_apis          = true
#            retention_policy_days = 7
#            version               = "1.0"
#        }
#    }

    share_properties {

        retention_policy {
            days = 7
        }
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_subnet.hvsoc_siempf_subnet-container-instances_Subnet
    ]
}
