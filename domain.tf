resource "digitalocean_domain" "default" {
  name       = "rancher-mylabs.tech"
  ip_address = digitalocean_loadbalancer.k3s_lb.ip
}