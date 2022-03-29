variable "region" {
  type        = string
  description = "Region that will used to deploy the cluster"
  default     = "sgp1"
  validation {
    condition     = length(regexall("^ams3|blr1|fra1|lon1|nyc1|nyc3|sfo3|sgp1|tor1$", var.region)) > 0
    error_message = "Invalid region. Valid regions are: ams3, blr1, fra1, lon1, nyc1, nyc3, sfo3, sgp1, tor1"
  }
}

variable "vpc_network_range" {
  type        = string
  description = "Range of IP addresses for the VPC in CIDR notation. Cannot be larger than /16 or smaller than /24. Default is 10.10.10.0/24"
  default     = "172.11.10.0/24"
}

variable "server_size" {
  type        = string
  description = "Server droplet size. e.g. s-1vcpu-2gb"
  default     = "s-1vcpu-2gb"
}

variable "server_count" {
  type        = number
  description = "Number of server (master) nodes to provision"
  default     = 2
}