provider vra {
  url           = registry.terraform.io/hashicorp/vra
}

provider vra {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = true
}

data "vra_project" "this" {
  name = var.project_name
}

data "vra_catalog_item" "this" {
  name            = var.catalog_item_name
  expand_versions = true
}

resource "vra_deployment" "this" {
  name        = var.deployment_name
  description = "terraform test deployment"

  catalog_item_id      = data.vra_catalog_item.this.id
  catalog_item_version = var.catalog_item_version
  project_id           = data.vra_project.this.id

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