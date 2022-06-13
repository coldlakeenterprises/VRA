variable "kube_ip" {
  description = "IP for Kubernetes"
  default = "192.168.104.55:16443"
  }
  
variable "nginx_node_port" {
  description = "NGINX Node Port"
  default = "30202"
  }