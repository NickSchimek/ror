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
    When I run `ror m render` interactively
    And I type "v"
    Then the output should contain "Actionview type 'view' or 'v'"
    And the output should contain "Please choose a class for the render method"
    And the output should contain "partial: '<relative_file_name>'"

  Scenario: Displays the views render method when I type 'view' after the prompt
    When I run `ror m render` interactively
    When I type "view"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actionview type 'view' or 'v'"
    And the output should contain "partial: '<relative_file_name>'"

  Scenario: Displays the views render method when I type 'c' after the prompt
    When I run `ror m render` interactively
    And I type "c"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actioncontroller type 'controller' or 'c'"
    And the output should contain "render '<:view>'"

  Scenario: Displays the views render method when I type 'controller' after the prompt
    When I run `ror m render` interactively
    And I type "controller"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actioncontroller type 'controller' or 'c'"
    And the output should contain "render '<:view>'"
