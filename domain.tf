resource "digitalocean_domain" "k3s_domain" {
  name       = "rancher-mylabs.tech"
  ip_address = digitalocean_loadbalancer.k3s_lb.ip
}