Feature: Display method render
  As a CLI
  In order to view a methods syntax
  I want to display information on any given method

  Scenario: Display Actionviews render method
    When I run `ror m render view`
    Then the output should contain "partial: '<relative_file_name>'"

  Scenario: Responds to invalid klass option
    When I run `ror m render DHH`
    Then the output should contain "Undefined class option: Use 'ror m METHOD' to view class options."

  Scenario: Display Actioncontrollers render method
    When I run `ror m render controller`
    Then the output should contain "render '<:view>'"

  Scenario: Displays the views render method when I type 'v' after the prompt
    When I run `ror m render`
    Then the output should contain "Which render method?"
    And the output should contain "Type 'view' or 'v' for Actionview's render method"
    When I type "v"
    Then the output should contain "partial: '<relative_file_name>'"

  Scenario: Displays the views render method when I type 'view' after the prompt
    When I run `ror m render`
    Then the output should contain "Which render method?"
    And the output should contain "Type 'view' or 'v' for Actionview's render method"
    When I type "view"
    Then the output should contain "partial: '<relative_file_name>'"

  Scenario: Displays the views render method when I type 'c' after the prompt
    When I run `ror m render`
    Then the output should contain "Which render method?"
    And the output should contain "Type 'controller' or 'c' for Actioncontroller's render method"
    When I type "c"
    Then the output should contain "render '<:view>'"

  Scenario: Displays the views render method when I type 'controller' after the prompt
    When I run `ror m render`
    Then the output should contain "Which render method?"
    And the output should contain "Type 'controller' or 'c' for Actioncontroller's render method"
    When I type "controller"
    Then the output should contain "render '<:view>'"
