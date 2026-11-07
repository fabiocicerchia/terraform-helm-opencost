# Specifications of terraform-helm-opencost

What this code does, one atomic Gherkin scenario per behaviour, read from the code by code-atlas.
Tags: `@verified` a test asserts it · `@inferred` read from the code only · `@gap` an entry point no test covers · `@human` written or amended by a person, never rewritten.

## Compatibility
Which tool and provider versions the module supports.

- **Provider requirements**: [Declaring the required Helm provider](compatibility/provider-requirements/provider-requirements.feature) (1)
- **Toolchain requirements**: [Declaring the supported Terraform and OpenTofu versions](compatibility/toolchain-requirements/toolchain-requirements.feature) (1)

## Deployment Reporting
Exposing facts about the installed OpenCost so other infrastructure can consume them.

- **Deployment details**: [Reporting the deployed OpenCost release](deployment-reporting/deployment-details/deployment-details.feature) (2)
- **Example outputs**: [Re-exporting OpenCost deployment details from a calling configuration](deployment-reporting/example-outputs/example-deployment-outputs.feature) (1)

## Developer Tooling
Commands and quality gates contributors use to maintain the module.

- **Task commands**: [Discovering and running the repository's task verbs](developer-tooling/task-commands/make-verbs.feature) (4)

## Getting Started
Reference material showing how to adopt the module.

- **Usage example**: [Trying OpenCost with the ready-made example](getting-started/usage-example/usage-example.feature) (1)
