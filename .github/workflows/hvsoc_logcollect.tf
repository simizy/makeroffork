# azurerm_resource_group.hvsoc_logcollect:
resource "azurerm_test" "hvsoc_logcollect" {

    location = "japaneast"
    name     = var.resorcegroup_hvsoc_logcollect_name
    tags     = {}

    timeouts {}
}
