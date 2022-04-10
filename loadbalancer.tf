resource "digitalocean_loadbalancer" "k3s_lb" {
  name     = "k3s-loadbalancer"
  region   = var.region
  vpc_uuid = digitalocean_vpc.k3s_vpc.id

  forwarding_rule {
    entry_port      = 6443
    entry_protocol  = "https"

    target_port     = 6443
    target_protocol = "https"

    tls_passthrough = true
  }

  healthcheck {
    port     = 6443
    protocol = "tcp"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 443
    target_protocol = "https"

    certificate_name = digitalocean_certificate.k3s-cert.name
  }

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }  

  droplet_tag = local.server_tag
}

resource "digitalocean_project_resources" "k3s_lb" {
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_loadbalancer.k3s_lb.urn
  ]
}