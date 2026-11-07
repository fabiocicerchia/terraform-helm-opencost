@domain:deployment-reporting @area:example-outputs @from:examples/outputs
Feature: Re-exporting OpenCost deployment details from a calling configuration
  Shows operators who copy the example how to surface the namespace, release name and chart version of their OpenCost install, so they can read them after an apply.

  Background:
    Given the operator applies the example configuration, which installs OpenCost through the module as release "opencost" in namespace "opencost-system"

  @id:deployment-reporting.example-outputs.001 @rule:deployment-reporting.example-outputs.reexports-module-details @inferred @source:examples/outputs.tf#opencost_namespace
  Scenario Outline: The example configuration reports each deployment detail of the module under an opencost-prefixed name
    Given the module reports its <module_output> for the deployed OpenCost
    When the operator reads the outputs of the example configuration
    Then the output "<example_output>" is present
    And it shows the same value as the module's <module_output>, for example <example_value>

    Examples:
      | example_output         | module_output | example_value                             |
      | opencost_namespace     | namespace     | opencost-system                           |
      | opencost_release_name  | release_name  | opencost                                  |
      | opencost_chart_version | chart_version | the chart version the install resolved to |
