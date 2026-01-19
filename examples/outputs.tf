output "opencost_namespace" {
  description = "The namespace where OpenCost is deployed"
  value       = module.opencost.namespace
}

output "opencost_release_name" {
  description = "The Helm release name of OpenCost"
  value       = module.opencost.release_name
}

output "opencost_chart_version" {
  description = "The chart version of the deployed OpenCost"
  value       = module.opencost.chart_version
}
