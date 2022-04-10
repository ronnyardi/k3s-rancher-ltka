resource "digitalocean_domain" "k3s_domain" {
  name       = var.domain_name
  ip_address = digitalocean_loadbalancer.k3s_lb.ip
}

resource "digitalocean_project_resources" "k3s_domain" {
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_domain.k3s_domain.urn
  ]
}