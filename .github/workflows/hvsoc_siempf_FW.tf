# azurerm_firewall.hvsoc_siempf_FW:
resource "azurerm_firewall" "hvsoc_siempf_FW" {
#    dns_servers         = []
    firewall_policy_id  = azurerm_firewall_policy.hvsoc_siempf_FW_policy.id

    location            = "japaneast"
    name                = "hvsoc_siempf_FW"
#    private_ip_ranges   = []
    resource_group_name = var.resorcegroup_hvsoc_siempf_name
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"
    tags                = {}
    threat_intel_mode   = "Alert"
    zones               = []

    ip_configuration {
        name                 = "hvsoc0101-siempfnfs-vnet-public-ip-FW"
#        private_ip_address   = "172.21.0.4"
        public_ip_address_id = azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip-FW.id
        subnet_id            = azurerm_subnet.hvsoc_siempf_AzureFirewallSubnet_Subnet.id
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip-FW,
        azurerm_subnet.hvsoc_siempf_AzureFirewallSubnet_Subnet,
        azurerm_firewall_policy.hvsoc_siempf_FW_policy
    ]
}
