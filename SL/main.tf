#####################################################################
##
##      Created 3/2/18 by ucdpadmin. for SL
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  password    = "${var.openstack_password}"
  tenant_name = "${var.openstack_project_name}"
  domain_name = "${var.openstack_domain_name}"
  auth_url    = "${var.openstack_auth_url}"
  region      = "${var.openstack_region}"
  insecure    = true
  version = "~> 1.2"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  version = "~> 1.1"
}

resource "openstack_compute_instance_v2" "instance" {
  name      = "${var.instance_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair  = "${openstack_compute_keypair_v2.auth.id}"
}

resource "azurerm_virtual_machine" "windows" {
  name                  = "${var.windows_name}"
  location              = "${var.vm_location}"
  vm_size               = "${var.vm_size}"
  resource_group_name   = "${azurerm_resource_group.group.name}"
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

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "openstack_compute_keypair_v2" "auth" {
    name = "openstack-temp-public-key"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "openstack_networking_secgroup_v2" "group_name" {
  name        = "group_name"
  description = "TODO"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.group_name.id}"
}

resource "azurerm_resource_group" "group" {
  name     = "group"
  location = "${var.location}"
}

