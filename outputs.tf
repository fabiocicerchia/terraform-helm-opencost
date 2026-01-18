output "namespace" {
  description = "The namespace where OpenCost is deployed"
  value       = module.opencost.namespace
}

output "release_name" {
  description = "The Helm release name of OpenCost"
  value       = module.opencost.release_name
}

output "version" {
  description = "The version of OpenCost deployed"
  value       = module.opencost.version
}
