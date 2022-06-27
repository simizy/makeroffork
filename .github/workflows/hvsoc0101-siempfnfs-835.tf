# azurerm_network_interface.hvsoc0101-siempfnfs-835:
resource "azurerm_network_interface" "hvsoc0101-siempfnfs-835" {
#    applied_dns_servers           = []
    dns_servers                   = []
    enable_accelerated_networking = false
    enable_ip_forwarding          = false

    location                      = "japaneast"
#    mac_address                   = "00-0D-3A-6F-9F-A8"
    name                          = "hvsoc0101-siempfnfs-835"
#    private_ip_address            = "172.19.0.4"
#    private_ip_addresses          = [
#        "172.19.0.4",
#    ]
    resource_group_name           = var.resorcegroup_hvsoc_siempf_name
    tags                          = {}


    ip_configuration {
        name                          = "ipconfig1"
        primary                       = true
        private_ip_address            = "172.19.0.4"
        private_ip_address_allocation = "Dynamic"
        private_ip_address_version    = "IPv4"
        subnet_id                     = azurerm_subnet.hvsoc_siempf_subnet-redmine_Subnet.id
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_subnet.hvsoc_siempf_subnet-redmine_Subnet
    ]
}
