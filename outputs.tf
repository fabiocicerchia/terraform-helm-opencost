output "namespace" {
  description = "Kubernetes namespace where OpenCost is deployed"
  value       = helm_release.opencost.namespace
}

output "release_name" {
  description = "Helm release name of OpenCost"
  value       = helm_release.opencost.name
}

output "chart_version" {
  description = "Chart version of OpenCost deployment"
  value       = helm_release.opencost.version
}
