resource "digitalocean_droplet" "k3s_server_init" {
  count = 1
  name  = "k3s-server-${var.region}-${random_id.server_node_id[count.index].hex}-1"

  image      = "ubuntu-20-04-x64"
  tags       = [local.server_droplet_tag]
  region     = var.region
  size       = var.server_size
  monitoring = true
}
resource "digitalocean_project_resources" "k3s_init_server_node" {
  count   = 1
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_droplet.k3s_server_init[count.index].urn,
  ]
}