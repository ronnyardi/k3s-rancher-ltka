resource "digitalocean_droplet" "k3s_agent" {
  count = var.agent_count
  name  = "k3s-agent-${count.index + 1}"

  image      = "ubuntu-20-04-x64"
  tags       = [local.agent_tag]
  region     = var.region
  size       = var.agent_size
  monitoring = true
  vpc_uuid   = digitalocean_vpc.k3s_vpc.id
  ssh_keys   = var.ssh_key_fingerprints
}

resource "digitalocean_project_resources" "k3s_agent_nodes" {
  count   = var.agent_count
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_droplet.k3s_agent[count.index].urn,
  ]
}