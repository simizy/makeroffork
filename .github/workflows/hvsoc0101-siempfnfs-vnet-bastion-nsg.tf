# azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-bastion-nsg:
resource "azurerm_network_security_group" "hvsoc0101-siempfnfs-vnet-bastion-nsg" {

    location            = "japaneast"
    name                = "hvsoc0101-siempfnfs-vnet-bastion-nsg"
    resource_group_name = var.resorcegroup_hvsoc_siempf_name
    security_rule       = [
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Allow_AzureLoadBalancer_InBound"
            priority                                   = 1020
            protocol                                   = "TCP"
            source_address_prefix                      = "AzureLoadBalancer"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Allow_GatewayManager_InBound"
            priority                                   = 1010
            protocol                                   = "TCP"
            source_address_prefix                      = "GatewayManager"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Allow_HTTPS_InBound"
            priority                                   = 1000
            protocol                                   = "TCP"
            source_address_prefix                      = "Internet"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "AzureCloud"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "Allow_AzureCloud_OutBound"
            priority                                   = 1010
            protocol                                   = "TCP"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "Internet"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "80"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "Allow_GetSessionInfomation"
            priority                                   = 1030
            protocol                                   = "*"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "VirtualNetwork"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "22",
                "3389",
            ]
            direction                                  = "Outbound"
            name                                       = "Allow_SSH_RDP_OutBound"
            priority                                   = 1000
            protocol                                   = "*"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "VirtualNetwork"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "5701",
                "8080",
            ]
            direction                                  = "Inbound"
            name                                       = "Allow_AzureBastionHostCommunication"
            priority                                   = 1030
            protocol                                   = "*"
            source_address_prefix                      = "VirtualNetwork"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "VirtualNetwork"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "5701",
                "8080",
            ]
            direction                                  = "Outbound"
            name                                       = "Allow_AzureBastionommunication"
            priority                                   = 1020
            protocol                                   = "*"
            source_address_prefix                      = "VirtualNetwork"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Deny"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Deny_All_InBound"
            priority                                   = 4096
            protocol                                   = "*"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Deny"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "Deny_All_OutBound"
            priority                                   = 4096
            protocol                                   = "*"
            source_address_prefix                      = "*"
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
