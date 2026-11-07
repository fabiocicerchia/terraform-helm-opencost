@domain:compatibility @area:provider-requirements @from:terraform-helm-opencost/versions
Feature: Declaring the required Helm provider
  Tells operators which Helm provider the OpenCost module installs through and the oldest release it accepts, so the right provider is downloaded and an outdated one is refused.

  Background:
    Given the operator's configuration calls the OpenCost module

  @id:compatibility.provider-requirements.001 @rule:compatibility.provider.helm-2-or-later @inferred @source:versions.tf#terraform
  Scenario Outline: The module requires the hashicorp/helm provider at version 2.0 or later
    Given the operator's configuration allows hashicorp/helm <provider_version>
    When the operator initialises the configuration
    Then initialisation <outcome>

    Examples:
      | provider_version | outcome                                                                            |
      | 1.3.2            | is refused because no provider version satisfies the module's ">= 2.0" requirement |
      | 2.0.0            | proceeds and installs hashicorp/helm 2.0.0                                         |
      | 2.17.0           | proceeds and installs hashicorp/helm 2.17.0                                        |
      | 3.0.2            | proceeds and installs hashicorp/helm 3.0.2                                         |
