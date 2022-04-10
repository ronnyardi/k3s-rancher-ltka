resource "digitalocean_certificate" "k3s-cert" {
  name    = "k3s-certificate"
  type    = "lets_encrypt"
  domains = [var.domain_name]
}