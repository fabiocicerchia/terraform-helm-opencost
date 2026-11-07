@domain:getting-started @area:usage-example @from:examples/examples
Feature: Trying OpenCost with the ready-made example
  Gives an operator a copy-ready configuration that installs OpenCost with typical settings, so they can see the module working before writing their own.

  Background:
    Given the operator has a Kubernetes cluster reachable by the Helm provider

  @id:getting-started.usage-example.001 @rule:getting-started.example-provider-setup.helm-provider-limited-to-2x @inferred @source:examples/main.tf#terraform @questionable
  Scenario Outline: The example accepts only Helm provider 2.x and Terraform 1.0 or newer
    Given the operator uses the example configuration
    When the operator initialises the example with Helm provider version <helm_version>
    Then initialisation <outcome>

    Examples:
      | helm_version | outcome                              |
      | 2.17.0       | succeeds                             |
      | 3.0.0        | is refused by the version constraint |
