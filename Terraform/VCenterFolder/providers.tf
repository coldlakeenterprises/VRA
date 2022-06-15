terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
    }
  }
  required_version = ">= 0.13"
}

provider "vra" {
  url           = "https://CLE-VRA01.coldlake.local"
  refresh_token = "RYataaTydHfuFwmNi81lZJ0ia6PdczAg"
  insecure      = true
}