#####################################################################
##
##      Created 3/2/18 by ucdpadmin. for VMware
##
#####################################################################

variable "virtual_machine_template_name" {
  type = "string"
  description = "Generated"
  default = "CentOS7_THIN"
}

variable "virtual_machine_datacenter_name" {
  type = "string"
  description = "Generated"
  default = "vCenterr"
}

variable "virtual_machine_datastore_name" {
  type = "string"
  description = "Generated"
  default = "UCD-VRA-RSX6-001"
}

variable "user" {
  type = "string"
  description = "Generated"
  default = "Administrator@ucd-vc6.rtp"
}

variable "password" {
  type = "string"
  description = "Generated"
  default = "UCDvc60!"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
  default = "ucd-vc6-01.rtp.raleigh.ibm.com"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
  default = "true"
}

variable "virtual_machine_name" {
  type = "string"
  description = "Virtual machine name for virtual_machine"
  default = "xubin_vmware1"
}

variable "virtual_machine_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
  default = "1"
}

variable "virtual_machine_memory" {
  type = "string"
  description = "Memory allocation."
  default = "1024"
}

variable "virtual_machine_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
  default = "20"
}

variable "virtual_disk_size" {
  type = "string"
  description = "Generated"
  default = "20"
}

variable "virtual_disk_vmdk_path" {
  type = "string"
  description = "Generated"
  default = "bbubuntu/bbubuntus.vmdk"
}

variable "virtual_disk_datacenter_name" {
  type = "string"
  description = "The name of the datacenter in which to create the disk. Can be omitted when when ESXi or if there is only one datacenter in your infrastructure."
  default = "vCenterr"
}

variable "virtual_disk_datastore_name" {
  type = "string"
  description = "The name of the datastore in which to create the disk."
  default = "UCD-VRA-RSX6-001"
}

variable "virtual_disk_disk_type" {
  type = "string"
  description = "The type of disk to create. Can be one of eagerZeroedThick, lazy, or thin. Default: eagerZeroedThick."
  default = "eagerZeroedThick"
}

variable "virtual_disk_disk_label" {
  type = "string"
  description = "Generated"
  default = "xubin_virtual_disk"
}

variable "virtual_machine_disk_label" {
  type = "string"
  description = "Generated"
  default = "xubin_os_disk_label"
}

variable "network_network_name" {
  type = "string"
  description = "Generated"
  default = "VIS241"
}

variable "resource_pool_resource_pool" {
  type = "string"
  description = "Resource pool."
  default = "resgroup-75"
}

variable "unit_number" {
  type = "string"
  description = "Generated"
  default = "1"
}

