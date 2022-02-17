terraform {
  required_version = ">= 0.13"
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = "0.3.5"
    }
  }
}

provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}