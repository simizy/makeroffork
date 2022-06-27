# azurerm_dev_test_global_vm_shutdown_schedule.shutdown-computevm-hvsoc0101-siempfnfs-vm-linux-sp-sa:
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown-computevm-hvsoc0101-siempfnfs-vm-linux-sp-sa" {
    daily_recurrence_time = "0000"
    enabled               = true

    location              = "japaneast"
    tags                  = {}
    timezone              = "Tokyo Standard Time"
    virtual_machine_id    = azurerm_virtual_machine.hvsoc0101-siempfnfs-vm-linux-sp-sa.id

    notification_settings {
        email           = var.vm_sp_sa_notification_email
        enabled         = true
        time_in_minutes = 30
    }

    timeouts {}
    depends_on = [
        azurerm_resource_group.hvsoc_siempf
    ]
}
