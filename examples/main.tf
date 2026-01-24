terraform {
  required_version = ">= 1.0"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

module "opencost" {
  source = "../"

  release_name  = "opencost"
  namespace     = "opencost-system"
  chart_version = ""

  values = yamlencode({})
}
