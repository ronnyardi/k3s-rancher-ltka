resource "digitalocean_vpc" "k3s_vpc" {
  name        = "k3s-vpc"
  description = "VPC for K3s cluster"
  region      = var.region
  ip_range    = var.network_range
}