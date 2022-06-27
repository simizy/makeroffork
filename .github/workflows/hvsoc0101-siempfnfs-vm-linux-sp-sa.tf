# azurerm_virtual_machine.hvsoc0101-siempfnfs-vm-linux-sp-sa:
resource "azurerm_virtual_machine" "hvsoc0101-siempfnfs-vm-linux-sp-sa" {

    location              = "japaneast"
    name                  = "hvsoc0101-siempfnfs-vm-linux-sp-sa"
    network_interface_ids = [
        azurerm_network_interface.hvsoc0101-siempfnfs-484.id
    ]
    resource_group_name   = var.resorcegroup_hvsoc_siempf_name
    tags                  = {}
    vm_size               = "Standard_D4ds_v4"
    zones                 = []

    boot_diagnostics {
        enabled = true
	storage_uri = ""
    }

    os_profile {
        admin_username = "Hvsoc"
        computer_name  = "hvsoc0101-siempfnfs-vm-linux-sp-sa"
        admin_password = var.hvsoc0101-siempfnfs-vm-linux-sp-sa_admin_password
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    storage_image_reference {
        offer     = "RHEL"
        publisher = "RedHat"
        sku       = "82gen2"
        version   = "latest"
    }

    storage_os_disk {
        caching                   = "ReadWrite"
        create_option             = "FromImage"
        disk_size_gb              = 128
        managed_disk_type         = "Premium_LRS"
        name                      = "sp-sa_Os_disk"
        os_type                   = "Linux"
        write_accelerator_enabled = false
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf,
        azurerm_network_interface.hvsoc0101-siempfnfs-484 
    ]

}
