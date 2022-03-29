terraform {
  required_providers {
      digitalocean = {
          source = "digitalocean/digitalocean"
          version = "1.22.2"
      }
  }

  cloud {
    organization = "rancher-mylabs"

    workspaces {
      name = "gh-action-digitalocean"
    }
  }
}
