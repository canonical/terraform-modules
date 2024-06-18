terraform {
  required_version = ">= 1.6"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.12.0"
    }
    juju = {
      source  = "juju/juju"
      version = ">= 0.10.0"
    }
  }
}
