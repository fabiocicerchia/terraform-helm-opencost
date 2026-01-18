kubeconfig_path = "~/.kube/config"
release_name    = "opencost-charts"
namespace       = "opencost"
chart_version   = ""
# https://github.com/opencost/opencost-helm-chart/blob/main/charts/opencost/values.yaml
values = {
  opencost = {
    carbonCost = {
      enabled = true
    }
    prometheus = {
      internal = {
        serviceName   = "prometheus-kube-prometheus-prometheus"
        port          = 9090
        namespaceName = "monitoring"
      }
    }
  }
}
