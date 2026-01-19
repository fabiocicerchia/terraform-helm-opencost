resource "helm_release" "opencost" {
  name       = var.release_name
  repository = "https://opencost.github.io/opencost-helm-chart"
  chart      = "opencost"
  version    = var.chart_version != "" ? var.chart_version : null

  dependency_update = true
  create_namespace  = true
  namespace         = var.namespace
  replace           = true

  values = [yamlencode(var.values)]
}
