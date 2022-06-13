provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {}

resource "vsphere_folder" "folder" {
  path          = var.folder_name
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}