# Terraform Module for OpenCost

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
  source = "fabiocicerchia/opencost/helm"

  release_name    = "opencost-charts"
  namespace       = "opencost"
}
```

## Inputs

| Name            | Description                                  | Type     | Default             | Required |
| --------------- | -------------------------------------------- | -------- | ------------------- | :------: |
| `release_name`  | Helm release name for OpenCost               | `string` | `"opencost-charts"` | no       |
| `namespace`     | Kubernetes namespace for OpenCost            | `string` | `"opencost"`        | no       |
| `chart_version` | Helm chart version (empty string for latest) | `string` | `""`                | no       |
| `values`        | Helm values for OpenCost deployment          | `any`    | `{}`                | no       |

## Outputs

| Name            | Description                                     |
| --------------- | ----------------------------------------------- |
| `namespace`     | Kubernetes namespace where OpenCost is deployed |
| `release_name`  | Helm release name of OpenCost                   |
| `chart_version` | Chart version of OpenCost deployment            |

## Requirements

- Terraform >= 1.0 or OpenTofu >= 1.6
- Helm >= 2.0
- Kubernetes v1.24+
- kubectl configured to access your cluster

### Dependencies

**Important:** OpenCost requires Prometheus to function properly. Ensure you have Prometheus deployed in your cluster and configure OpenCost to connect to it via the `values` configuration.

## Usage

### Basic Deployment

```hcl
module "opencost" {
  source = "fabiocicerchia/opencost/helm"

  namespace       = "opencost"
}
```

### With Custom Prometheus Endpoint

```hcl
module "opencost" {
  source = "fabiocicerchia/opencost/helm"

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
  source = "fabiocicerchia/opencost/helm"

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

## Make targets

`make help` lists them. Every repository in this estate exposes the same eight
verbs, so you do not have to read a Makefile to find out how to build or test it
(FC-GEN-057).

| Verb      | What it does here                                    |
| --------- | ---------------------------------------------------- |
| `setup`   | Install the pre-commit hook                          |
| `install` | Download the providers this module pins              |
| `lint`    | `pre-commit run --all-files` — the whole gate        |
| `format`  | `terraform fmt -recursive`                           |
| `test`    | `terraform validate` on the module and every example |
| `analyze` | `tflint --recursive`                                 |

### Not applicable

Two verbs have no meaning for a Terraform module. They exit 0 and say so rather
than pretending to work (FC-GEN-058):

- `build` — nothing is compiled; the module is consumed from source.
- `run` — a module is instantiated by a root module, never executed directly.

## License

MIT
