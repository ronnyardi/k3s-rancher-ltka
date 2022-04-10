resource "digitalocean_certificate" "k3s-cert" {
  name    = "k3s-certificate"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.k3s_domain.name]
}