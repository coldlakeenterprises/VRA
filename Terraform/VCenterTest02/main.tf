terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
    }
  }
  required_version = ">= 0.13"
}

provider vra {
  url           = "https://cle-vra01.coldlake.local"
  refresh_token = "RYataaTydHfuFwmNi81lZJ0ia6PdczAg"
  insecure      = true
}

data "vra_project" "this" {
  name = "CLE-LAB"
}

resource "vra_deployment" "this" {
  name        = "TerraformTest"
  description = "terraform test deployment"

  catalog_item_id      = "CentOS7Base"
  catalog_item_version = "1"
  project_id           = "CLE-LAB"

  inputs = {
    flavor    = "Lab-Small"
    image     = "CentOS7"
    count     = 1
    password  = "VMware1!"
    hostname1 = "Terraform-VM"
  }

  timeouts {
    create = "60m"
    delete = "60m"
    update = "60m"
  }
}