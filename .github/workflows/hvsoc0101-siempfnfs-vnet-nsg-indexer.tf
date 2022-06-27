# azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-nsg-indexer:
resource "azurerm_network_security_group" "hvsoc0101-siempfnfs-vnet-nsg-indexer" {

    location            = "japaneast"
    name                = "hvsoc0101-siempfnfs-vnet-nsg-indexer"
    resource_group_name = var.resorcegroup_hvsoc_siempf_name
    security_rule       = [
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "9997"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Port_SplunkReceive"
            priority                                   = 100
            protocol                                   = "TCP"
            source_address_prefix                      = "20.191.190.193"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
    ]
    tags                = {}

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}
