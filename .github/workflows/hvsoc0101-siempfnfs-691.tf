# azurerm_network_interface.hvsoc0101-siempfnfs-691:
resource "azurerm_network_interface" "hvsoc0101-siempfnfs-691" {
#    applied_dns_servers           = []
    dns_servers                   = []
    enable_accelerated_networking = false
    enable_ip_forwarding          = false

    location                      = "japaneast"
#    mac_address                   = "00-22-48-68-53-83"
    name                          = "hvsoc0101-siempfnfs-691"
#    private_ip_address            = "172.18.0.5"
#    private_ip_addresses          = [
#        "172.18.0.5",
#    ]
    resource_group_name           = var.resorcegroup_hvsoc_siempf_name
    tags                          = {}


    ip_configuration {
        name                          = "ipconfig1"
        primary                       = true
        private_ip_address            = "172.18.0.5"
        private_ip_address_allocation = "Dynamic"
        private_ip_address_version    = "IPv4"
        public_ip_address_id          = azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip3.id
        subnet_id                     = azurerm_subnet.hvsoc_siempf_subnet-indexer_Subnet.id
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip3,
        azurerm_subnet.hvsoc_siempf_subnet-indexer_Subnet
    ]

}
