# azurerm_firewall_policy.hvsoc_siempf_FW_policy:
resource "azurerm_firewall_policy" "hvsoc_siempf_FW_policy" {
#    child_policies           = []
#    firewalls                = [

#    ]

    location                 = "japaneast"
    name                     = "hvsoc_siempf_FW_policy"
#    private_ip_ranges        = []
    resource_group_name      = var.resorcegroup_hvsoc_siempf_name
#    rule_collection_groups   = [

#    ]
    sku                      = "Standard"
    tags                     = {}
    threat_intelligence_mode = "Alert"

    dns {
       #comment: 'network_rule_fqdn_enabled' is deprecated
#        network_rule_fqdn_enabled = false
        proxy_enabled             = true
        servers                   = []
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}
