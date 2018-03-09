#####################################################################
##
##      Created 3/5/18 by ucdpadmin. for azure
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  version = "~> 1.1"
}


resource "azurerm_virtual_machine" "windows" {
  name                  = "${var.windows_name}"
  location              = "${var.vm_location}"
  vm_size               = "${var.vm_size}"
  resource_group_name   = "${azurerm_resource_group.group.name}"
  storage_data_disk {
    name             ="${var.azure_disk_name}"
    managed_disk_type="${var.azure_disk_managed_disk_type}"
    create_option   = "${var.azure_disk_managed_disk_create_option}"
    lun             = "${var.azure_disk_managed_disk_lun}"
    disk_size_gb    = "${var.azure_disk_managed_disk_size_gb}"
  }
  tags {
    Name = "${var.windows_name}"
  }
  os_profile {
    computer_name  = "${var.windows_os_profile_name}"
    admin_username = "${var.windows_azure_user}"
    admin_password = "${var.windows_azure_user_password}"
  }
  storage_image_reference {
    publisher = "${var.windows_publisher}"
    offer     = "${var.windows_offer}"
    sku       = "${var.windows_sku}"
    version   = "${var.windows_version}"
  }
  storage_os_disk {
    name              = "${var.windows_os_disk_name}"
    caching           = "${var.windows_os_disk_caching}"
    create_option     = "${var.windows_os_disk_create_option}"
    managed_disk_type = "${var.windows_os_disk_managed_disk_type}"
  }
  delete_os_disk_on_termination = "${var.windows_os_disk_delete}"
}

resource "azurerm_resource_group" "group" {
  name     = "group"
  location = "${var.location}"
}

resource "azurerm_network_security_group" "security_group" {
  name                = "security_group"
  location            = "${var.vm_location}"
  resource_group_name   = "${azurerm_resource_group.group.name}"
  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}