#####################################################################
##
##      Created 3/2/18 by ucdpadmin. for VMware
##
#####################################################################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "virtual_machine_template" {
  name          = "${var.virtual_machine_template_name}"
  datacenter_id = "${data.vsphere_datacenter.virtual_machine_datacenter.id}"
}

data "vsphere_datacenter" "virtual_machine_datacenter" {
  name = "${var.virtual_machine_datacenter_name}"
}

data "vsphere_datastore" "virtual_machine_datastore" {
  name          = "${var.virtual_machine_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.virtual_machine_datacenter.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_network_name}"
  datacenter_id = "${data.vsphere_datacenter.virtual_machine_datacenter.id}"
}

resource "vsphere_virtual_machine" "virtual_machine" {
  name          = "${var.virtual_machine_name}"
  datastore_id  = "${data.vsphere_datastore.virtual_machine_datastore.id}"
  num_cpus      = "${var.virtual_machine_number_of_vcpu}"
  memory        = "${var.virtual_machine_memory}"
  guest_id = "${data.vsphere_virtual_machine.virtual_machine_template.guest_id}"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  resource_pool_id = "${var.resource_pool_resource_pool}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.virtual_machine_template.id}"
  }
  disk {
    label = "${var.virtual_machine_disk_label}"
    size = "${var.virtual_machine_disk_size}"
  }
  disk {
    unit_number = "${var.unit_number}"
    attach = true
    label  = "${var.virtual_disk_disk_label}"
    path   = "${vsphere_virtual_disk.virtual_disk.vmdk_path}"
  }
}

resource "vsphere_virtual_disk" "virtual_disk" {
  size          = "${var.virtual_disk_size}"
  vmdk_path     = "${var.virtual_disk_vmdk_path}"
  datacenter    = "${var.virtual_disk_datacenter_name}"
  datastore     = "${var.virtual_disk_datastore_name}"
  type          = "${var.virtual_disk_disk_type}"
}