@domain:developer-tooling @area:task-commands @from:terraform-helm-opencost/makefile
Feature: Discovering and running the repository's task verbs
  Gives contributors the same self-documenting set of make verbs as every other repository, so they can find, validate and analyse the module without reading the Makefile, and never get a silent success from a verb that does nothing.

  Background:
    Given a contributor has a checkout of the module repository

  @id:developer-tooling.task-commands.001 @rule:tooling.make.bare-make-lists-verbs @inferred @source:Makefile#help
  Scenario: Running make with no verb lists every verb with its description
    When the contributor runs make with no verb
    Then each verb is listed by name with its one-line description
    And the list includes help, setup, install, lint, format, test, analyze, build and run
    And nothing is installed, validated or changed

  @id:developer-tooling.task-commands.002 @rule:tooling.make.not-applicable-verbs-explain-themselves @inferred @source:Makefile#build
  Scenario Outline: A verb that has no meaning for a module says why instead of pretending to work
    When the contributor runs the <verb> verb
    Then the message "<message>" is shown
    And the message points to README > Not applicable
    And the verb exits with status 0

    Examples:
      | verb  | message                                                                  |
      | build | Nothing to build: this is a Terraform module, consumed from source.      |
      | run   | Nothing to run: a module is called by a root module, never run directly. |

  @id:developer-tooling.task-commands.003 @rule:tooling.make.analyze-refuses-without-tflint @inferred @source:Makefile#analyze
  Scenario: Analysis is refused with an install pointer when tflint is missing
    Given tflint is not installed
    When the contributor runs the analyze verb
    Then the message "analyze needs tflint: https://github.com/terraform-linters/tflint" is shown on standard error
    And the verb fails, with make reporting error 69
    And no analysis is performed

  @id:developer-tooling.task-commands.004 @rule:tooling.make.test-validates-module-and-examples @inferred @source:Makefile#test
  Scenario: Testing validates both the module and its example without a backend
    Given the module and its example configuration are present
    When the contributor runs the test verb
    Then the module is initialised without a backend and validated
    And the example configuration is then initialised without a backend and validated
    And the verb fails if either validation fails
