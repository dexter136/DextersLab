terraform {
  required_version = "~> 1.3.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "dexterslab"

    workspaces {
      name = "homelab-secrets"
    }
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.0"
    }
  }
}

provider "kubernetes" {
}
