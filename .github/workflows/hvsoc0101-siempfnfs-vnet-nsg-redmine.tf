# azurerm_network_security_group.hvsoc0101-siempfnfs-vnet-nsg-redmine:
resource "azurerm_network_security_group" "hvsoc0101-siempfnfs-vnet-nsg-redmine" {

    location            = "japaneast"
    name                = "hvsoc0101-siempfnfs-vnet-nsg-redmine"
    resource_group_name = var.resorcegroup_hvsoc_siempf_name
    security_rule       = []
    tags                = {}

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}
