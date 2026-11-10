@domain:compatibility @area:toolchain-requirements @from:terraform-helm-opencost/versions
Feature: Declaring the supported Terraform and OpenTofu versions
  Tells operators up front which Terraform or OpenTofu releases can run the OpenCost module, so an unsupported toolchain is refused before anything is deployed.

  Background:
    Given the operator's configuration calls the OpenCost module

  @id:compatibility.toolchain-requirements.001 @rule:compatibility.toolchain.minimum-terraform-1-0 @inferred @source:versions.tf#terraform
  Scenario Outline: The module runs only on Terraform 1.0 or later
    Given the operator's toolchain is <toolchain> <version>
    When the operator initialises the configuration
    Then initialisation <outcome>

    Examples:
      | toolchain | version | outcome                                                     |
      | Terraform | 0.15.5  | is refused with an unsupported Terraform core version error |
      | Terraform | 1.0.0   | proceeds                                                    |
      | Terraform | 1.9.8   | proceeds                                                    |
      | OpenTofu  | 1.6.0   | proceeds                                                    |
