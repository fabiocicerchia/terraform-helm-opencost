# OpenCost Module

Terraform module to deploy OpenCost (cloud cost monitoring) on Kubernetes using Helm.

## Overview

OpenCost provides cost monitoring and allocation with carbon footprint tracking. It integrates with Prometheus for cost visibility across your Kubernetes clusters.

- **Cost Visibility**: Track infrastructure costs by workload, namespace, and pod
- **Carbon Tracking**: Monitor carbon emissions of your infrastructure
- **Prometheus Integration**: Uses Prometheus metrics for cost calculations
- **Multi-cluster Support**: Manage costs across multiple clusters

## Quick Start

```hcl
module "opencost" {
  source = "git::https://github.com/fabiocicerchia/terraform-k8s-opencost-module.git?ref=main"

  kubeconfig_path = "~/.kube/config"
  release_name    = "opencost-charts"
  namespace       = "opencost"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `kubeconfig_path` | Path to the kubeconfig file | `string` | `"~/.kube/config"` | no |
| `release_name` | Helm release name for OpenCost | `string` | `"opencost-charts"` | no |
| `namespace` | Kubernetes namespace for OpenCost | `string` | `"opencost"` | no |
| `chart_version` | Helm chart version (empty string for latest) | `string` | `""` | no |
| `values` | Helm values for OpenCost deployment | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `namespace` | Kubernetes namespace where OpenCost is deployed |
| `release_name` | Helm release name of OpenCost |
| `chart_version` | Chart version of OpenCost deployment |

## Requirements

- Terraform >= 1.0
- Helm >= 2.0
- Kubernetes v1.24+
- Prometheus (for metrics data)
- kubectl configured to access your cluster

## Usage

### Basic Deployment

```hcl
module "opencost" {
  source = "git::https://github.com/fabiocicerchia/terraform-k8s-opencost-module.git?ref=main"

  kubeconfig_path = "~/.kube/config"
  namespace       = "opencost"
}
```

### With Custom Prometheus Endpoint

```hcl
module "opencost" {
  source = "git::https://github.com/fabiocicerchia/terraform-k8s-opencost-module.git?ref=main"

  kubeconfig_path = "~/.kube/config"
  
  values = {
    prometheus = {
      server = "http://prometheus-server.monitoring.svc.cluster.local:80"
    }
  }
}
```

### Pin Chart Version

```hcl
module "opencost" {
  source = "git::https://github.com/fabiocicerchia/terraform-k8s-opencost-module.git?ref=main"

  kubeconfig_path = "~/.kube/config"
  chart_version   = "1.15.0"
}
```

## Access OpenCost

Port-forward to access OpenCost UI:

```bash
kubectl port-forward -n opencost svc/opencost 9090:9090
```

Visit `http://localhost:9090` to view cost data.

## Verify API Health

```bash
kubectl port-forward -n opencost svc/opencost 9090:9090
curl http://localhost:9090/healthz
```

## Resources

- [OpenCost Documentation](https://opencost.io/)
- [OpenCost Helm Chart](https://github.com/opencost/opencost-helm-chart)
- [OpenCost GitHub](https://github.com/opencost/opencost)
