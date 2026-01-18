provider "helm" {
  kubernetes = {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "opencost" {
  name       = var.release_name
  repository = "https://opencost.github.io/opencost-helm-chart"
  chart      = "opencost-charts/opencost"
  version    = var.chart_version != "" ? var.chart_version : null

  create_namespace = true
  namespace        = var.namespace
  replace          = true

  values = [var.values]
}
