# azurerm_resource_group.hvsoc_siempf:
resource "azurerm_resource_group" "hvsoc_siempf" {

    location = "japaneast"
    name     = var.resorcegroup_hvsoc_siempf_name
    tags     = {}

    timeouts {}
}
