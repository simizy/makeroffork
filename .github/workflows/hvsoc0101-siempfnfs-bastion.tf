# azurerm_bastion_host.hvsoc0101-siempfnfs-bastion:
resource "azurerm_bastion_host" "hvsoc0101-siempfnfs-bastion" {
#    dns_name            = "bst-f2c88429-627d-4e55-952f-cae7eb29a79d.bastion.azure.com"

    location            = "japaneast"
    name                = "hvsoc0101-siempfnfs-bastion"
    resource_group_name = var.resorcegroup_hvsoc_siempf_name
    sku                 = "Standard"
    tags                = {}

    ip_configuration {
        name                 = "IpConf"
        public_ip_address_id = azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip.id
        subnet_id            = azurerm_subnet.hvsoc_siempf_AzureBastion_Subnet.id
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip,
        azurerm_subnet.hvsoc_siempf_AzureBastion_Subnet
    ]

}
