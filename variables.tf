variable "region" {
  type        = string
  description = "Region that will used to deploy the cluster"
  default     = "sgp1"
  validation {
    condition     = length(regexall("^ams3|blr1|fra1|lon1|nyc1|nyc3|sfo3|sgp1|tor1$", var.region)) > 0
    error_message = "Invalid region. Valid regions are: ams3, blr1, fra1, lon1, nyc1, nyc3, sfo3, sgp1, tor1."
  }
}

variable "network_range" {
  type        = string
  description = "IP addresses range for VPC in CIDR notation and must comply with RFC 1918"
  default     = "10.2.15.0/24"
}

variable "server_size" {
  type        = string
  description = "Server droplet size. More information, send GET to DigitalOcean rest API of https://api.digitalocean.com/v2/sizes"
  default     = "s-1vcpu-2gb"
}

variable "agent_size" {
  type        = string
  description = "Server droplet size. More information, send GET to DigitalOcean rest API of https://api.digitalocean.com/v2/sizes"
  default     = "s-2vcpu-4gb"
}

variable "server_count" {
  type        = number
  description = "Number of master nodes to provision"
  default     = 2
}

variable "agent_count" {
  type        = number
  description = "Number of agent nodes to provision"
  default     = 3
}

variable "ssh_key_fingerprints" {
  type        = list(string)
  description = "List of SSH Key fingerprints"
  default     = ["34:9f:7a:e5:cf:7d:d9:ae:6b:f4:a2:a8:b4:98:88:6d"]
}