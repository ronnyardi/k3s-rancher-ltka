resource "digitalocean_database_cluster" "k3s" {
  name                 = "k3s-database"
  engine               = "pg"
  version              = "14"
  size                 = "db-s-1vcpu-1gb"
  region               = var.region
  private_network_uuid = digitalocean_vpc.k3s_vpc.id
  node_count           = 1
}

resource "digitalocean_database_user" "dbuser" {
  cluster_id = digitalocean_database_cluster.k3s.id
  name       = "k3s_user"
}

resource "digitalocean_project_resources" "k3s_external_db" {
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_database_cluster.k3s.urn
  ]
}