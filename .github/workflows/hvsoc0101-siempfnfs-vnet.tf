# azurerm_virtual_network.hvsoc0101-siempfnfs-vnet:
resource "azurerm_virtual_network" "hvsoc0101-siempfnfs-vnet" {
    address_space           = [
        "172.17.0.0/24",
        "172.18.0.0/24",
        "172.19.0.0/24",
        "172.20.0.0/24",
        "172.21.0.0/24",
    ]
    dns_servers             = []
#    flow_timeout_in_minutes = 0
#    guid                    = "aaa007cc-b68a-4cf7-b104-3dd87a19b15c"

    location                = "japaneast"
    name                    = "hvsoc0101-siempfnfs-vnet"
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name

    tags                    = {}
    # comment: 'vm_protectionenabled' is deprecated in favor of 'ddos_protection_plan'
    #vm_protection_enabled   = false

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}

resource "azurerm_subnet" "hvsoc_siempf_AzureBastion_Subnet" {
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    virtual_network_name = azurerm_virtual_network.hvsoc0101-siempfnfs-vnet.name
    address_prefixes = ["172.17.0.0/27"]
    name           = "AzureBastionSubnet"
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_virtual_network.hvsoc0101-siempfnfs-vnet
    ]
}

resource "azurerm_subnet_network_security_group_association" "hvsoc_siempf_AzureBastion_Subnet_network_security_group_association" {
    subnet_id = azurerm_subnet.hvsoc_siempf_AzureBastion_Subnet.id
    network_security_group_id = azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-bastion-nsg.id
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-bastion-nsg
    ]
}

resource "azurerm_subnet" "hvsoc_siempf_subnet-indexer_Subnet" {
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    virtual_network_name = azurerm_virtual_network.hvsoc0101-siempfnfs-vnet.name
    address_prefixes = ["172.18.0.0/24"]
    name           = "subnet-indexer"
    service_endpoints = [
        "Microsoft.KeyVault"
    ]
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_virtual_network.hvsoc0101-siempfnfs-vnet
    ]

}
resource "azurerm_subnet" "hvsoc_siempf_subnet-redmine_Subnet" {
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    virtual_network_name = azurerm_virtual_network.hvsoc0101-siempfnfs-vnet.name
    address_prefixes = ["172.19.0.0/24"]
    name           = "subnet-redmine"
    service_endpoints = [
        "Microsoft.KeyVault",
        "Microsoft.Storage"
    ]
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_virtual_network.hvsoc0101-siempfnfs-vnet
    ]
}
resource "azurerm_subnet" "hvsoc_siempf_subnet-container-instances_Subnet" {
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    virtual_network_name = azurerm_virtual_network.hvsoc0101-siempfnfs-vnet.name
    address_prefixes = ["172.20.0.0/24"]
    name           = "subnet-container-instances"

    service_endpoints = [
        "Microsoft.KeyVault",
        "Microsoft.Storage"
    ]

    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_virtual_network.hvsoc0101-siempfnfs-vnet
    ]
}
resource "azurerm_subnet_network_security_group_association" "hvsoc_siempf_subnet-container-instances_Subnet_network_security_group_association" {
    subnet_id = azurerm_subnet.hvsoc_siempf_subnet-container-instances_Subnet.id
    network_security_group_id = azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-nsg-indexer.id
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-nsg-indexer
    ]
}


resource "azurerm_subnet" "hvsoc_siempf_AzureFirewallSubnet_Subnet" {
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    virtual_network_name = azurerm_virtual_network.hvsoc0101-siempfnfs-vnet.name
    address_prefixes = ["172.21.0.0/24"]
    name           = "AzureFirewallSubnet"
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_virtual_network.hvsoc0101-siempfnfs-vnet
    ]
}

