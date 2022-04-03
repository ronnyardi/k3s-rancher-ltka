resource "digitalocean_droplet" "k3s_server" {
  count = var.server_count
  name  = "k3s-server-${count.index + 1}"

  image      = "ubuntu-20-04-x64"
  tags       = [local.server_tag]
  region     = var.region
  size       = var.server_size
  monitoring = true
  vpc_uuid   = digitalocean_vpc.k3s_vpc.id
}

resource "digitalocean_project_resources" "k3s_server_nodes" {
  count   = var.server_count
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_droplet.k3s_server[count.index].urn,
  ]
}