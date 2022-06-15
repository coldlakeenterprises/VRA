provider "kubernetes" {
  host=var.kube_ip
  version="~> 1.13"
  client_certificate = file("server.crt")
  client_key = file("server.key")
  cluster_ca_certificate = file("ca.crt")
  load_config_file = false
}