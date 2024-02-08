terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
    }
  }
}

variable "apic_username" {
}

variable "apic_password" {
  sensitive = true
  default = "C1sco123"
}

variable "apic_url" {
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
  insecure = true
  retries  = 4
}

module "aci" {
  source  = "netascode/nac-aci/aci"
  version = "0.8.0"

  yaml_directories = ["../../data/stuff-b"]

  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}