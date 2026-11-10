@domain:deployment-reporting @area:deployment-details @from:terraform-helm-opencost/outputs
Feature: Reporting the deployed OpenCost release
  Gives operators and calling Terraform configurations the namespace, release name and chart version of the OpenCost they deployed, so they can wire other resources to it and audit what is running.

  Background:
    Given the OpenCost module has been applied to a Kubernetes cluster

  @id:deployment-reporting.deployment-details.001 @rule:deployment-reporting.deployment-details.reports-namespace-and-release-name @inferred @source:outputs.tf#namespace
  Scenario Outline: The module reports the namespace and release name OpenCost was installed under
    Given the operator set the namespace to "<namespace_input>"
    And the operator set the release name to "<release_input>"
    When the operator reads the module's outputs
    Then the "namespace" output is "<namespace>"
    And the "release_name" output is "<release_name>"

    Examples:
      | namespace_input   | release_input     | namespace | release_name    |
      | (left at default) | (left at default) | opencost  | opencost-charts |
      | finops            | cost-tracker      | finops    | cost-tracker    |

  @id:deployment-reporting.deployment-details.002 @rule:deployment-reporting.deployment-details.reports-deployed-chart-version @inferred @source:outputs.tf#chart_version
  Scenario Outline: The module reports the OpenCost chart version that was deployed
    Given the operator set the chart version to "<chart_version_input>"
    When the operator reads the module's outputs
    Then the "chart_version" output is <reported_version>

    Examples:
      | chart_version_input     | reported_version                                   |
      | 1.42.0                  | "1.42.0"                                           |
      | (empty, meaning latest) | the version of the latest chart that was installed |
