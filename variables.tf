variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "release_name" {
  description = "Helm release name for OpenCost"
  type        = string
  default     = "opencost-charts"
}

variable "namespace" {
  description = "Kubernetes namespace for OpenCost"
  type        = string
  default     = "opencost"
}

variable "chart_version" {
  description = "OpenCost Helm chart version (empty string for latest)"
  type        = string
  default     = ""
}

variable "values" {
  description = "Helm values for OpenCost deployment"
  type        = any
  default     = {}
}
