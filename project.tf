resource "digitalocean_project" "k3s_cluster" {
  name        = "k3s-cluster"
  description = "K3s Lightweight Kubernetes Cluster"
  purpose     = "LTKA Project"
  environment = "Development"
}