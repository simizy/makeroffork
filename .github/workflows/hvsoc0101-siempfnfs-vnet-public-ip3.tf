# azurerm_public_ip.hvsoc0101-siempfnfs-vnet-public-ip3:
resource "azurerm_public_ip" "hvsoc0101-siempfnfs-vnet-public-ip3" {
    allocation_method       = "Static"
    availability_zone       = "Zone-Redundant"

    idle_timeout_in_minutes = 4
#    ip_address              = "20.89.187.227"
    ip_tags                 = {}
    ip_version              = "IPv4"
    location                = "japaneast"
    name                    = "hvsoc0101-siempfnfs-vnet-public-ip3"
    resource_group_name     = var.resorcegroup_hvsoc_siempf_name
    sku                     = "Standard"
    sku_tier                = "Regional"
    tags                    = {}
#    zones                   = []

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}
