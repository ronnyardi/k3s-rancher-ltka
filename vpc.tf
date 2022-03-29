resource "digitalocean_vpc" "k3s_vpc" {
  name     = "k3s-vpc"
  region   = var.region
  ip_range = var.vpc_network_range
}