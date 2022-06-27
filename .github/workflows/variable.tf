variable "resorcegroup_hvsoc_siempf_name" {
    description = "Specify the resource group name for SIEM-PF"
#    default = "hvsoc_siempf"
    default = "duplicate_hvsoc_siempf"
    type = string
}

variable "hvsoc0101-logcollnfs-vnet_default_subnet_id" {
    description ="ID of default Subnet in LogCollectVirtual network"
    default = "/subscriptions/e3b6ef5f-4e73-4510-9f11-2e94e2e518c7/resourceGroups/hvsoc_logcollect/providers/Microsoft.Network/virtualNetworks/hvsoc0101-logcollnfs-vnet/subnets/default"
    type = string
}

variable "hvsoc0101-siempfnfs-vm-linux-redmine_admin_password" {
    description = "admin password for redmine host."
    default = "x#uiAr2kfa8"
    type = string
}

variable "hvsoc0101-siempfnfs-vm-linux-sp-sa_admin_password" {
    description = "admin password for sp-sa host."
    default = "x#uiAr2kfa8"
    type = string
}

variable "hvsoc0101-siempfnfs-vm-linux-sp-hvyfrd_admin_password" {
    description = "admin password for sp-hvyfrd host."
    default = "x#uiAr2kfa8"
    type = string
}

variable "vm_sp_hvyfrd_notification_email" {
    default = "katsuya.sakurai.eh@hitachi.com;zihao.zhang.na@hitachi.com"
    type = string
}
variable "vm_sp_sa_notification_email" {
    default = "katsuya.sakurai.eh@hitachi.com;zihao.zhang.na@hitachi.com"
    type = string
}

variable "hvsoc0101siempfstorage_storage_account_name" {
    default = "dupliatesiempfstorage"
    type = string
}

variable "hvsocsplshareaccount_storage_account_name" {
    default = "duplicatesplshareaccount"
    type = string
}

variable "hvsocKeyVault_name" {
    default = "duplicateHvsocKeyVault"
    type = string
}



