#####################################################################
##
##      Created 3/5/18 by ucdpadmin. for azure
##
#####################################################################

variable "subscription_id" {
  type = "string"
  description = "Generated"
}

variable "client_id" {
  type = "string"
  description = "Generated"
}

variable "client_secret" {
  type = "string"
  description = "Generated"
}

variable "tenant_id" {
  type = "string"
  description = "Generated"
}

variable "windows_name" {
  type = "string"
  description = "Generated"
}

variable "vm_location" {
  type = "string"
  description = "Generated"
}

variable "vm_size" {
  type = "string"
  description = "Generated"
}

variable "windows_os_profile_name" {
  type = "string"
  description = "Specifies the os profile name."
  default = "profilename"
}

variable "windows_azure_user" {
  type = "string"
  description = "Generated"
}

variable "windows_azure_user_password" {
  type = "string"
  description = "Generated"
}

variable "windows_publisher" {
  type = "string"
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  type = "string"
  default = "WindowsServer"
}

variable "windows_sku" {
  type = "string"
  default = "Datacenter"
}

variable "windows_version" {
  type = "string"
  default = "latest"
}

variable "windows_os_disk_name" {
  type = "string"
  description = "Specifies the disk name."
  default ="osdiskname"
}

variable "windows_os_disk_caching" {
  type = "string"
  description = "Specifies the caching requirements. (Ex:ReadWrite)"
  default="ReadWrite"
}

variable "windows_os_disk_create_option" {
  type = "string"
  description = "Specifies how the virtual machine should be created. Possible values are Attach (managed disks only) and FromImage."
}

variable "windows_os_disk_managed_disk_type" {
  type = "string"
  description = "Specifies the type of managed disk to create. Value must be either Standard_LRS or Premium_LRS. Cannot be used when vhd_uri is specified"
  default = "Standard_LRS"
}

variable "windows_os_disk_delete" {
  type = "string"
  description = "Delete the OS disk automatically when deleting the VM"
  default = true
}

variable "location" {
  type = "string"
  description = "Generated"
}

variable "azure_disk_name" {
  type = "string"
  description = "Generated"
}

variable "azure_disk_managed_disk_type" {
  type = "string"
  description = "Must be either Standard_LRS or Premium_LRS."
  default = "Standard_LRS"
}

variable "azure_disk_managed_disk_create_option" {
  type = "string"
  description = "Values are Attach, FromImage or Empty"
  default = "Empty"
}

variable "azure_disk_managed_disk_lun" {
  type = "string"
  description = "Specifies the logical unit number of the data disk"
  default = "2"
}

variable "azure_disk_managed_disk_size_gb" {
  type = "string"
  description = "Specifies the size of the data disk in gigabytes"
  default = "1023"
}


