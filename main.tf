terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.16.0"
    }
  }

  backend "remote" {
    organization = "rancher-mylabs"

    workspaces {
      name = "gh-action-digitalocean"
    }
  }
}