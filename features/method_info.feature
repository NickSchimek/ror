Feature: Display method render
  As a CLI
  In order to view a methods syntax
  I want to display information on any given method

  Scenario: Display Actionviews render method
    When I run `ror info render view`
    Then the output should contain "Method: render\n Class: Actionview"

  Scenario: Responds to invalid klass option
    When I run `ror info render DHH`
    Then the output should contain "Undefined class option: Use 'ror info render' to view class options."

  Scenario: Display Actioncontrollers render method
    When I run `ror info render controller`
    Then the output should contain "Method: render\n Class: Actioncontroller"

  Scenario: Displays the views render method when I type 'v' after the prompt
    When I run `ror info render` interactively
    And I type "v"
    Then the output should contain "Actionview type 'view' or 'v'"
    And the output should contain "Please choose a class for the render method"
    And the output should contain "Method: render\n Class: Actionview"

  Scenario: Displays the views render method when I type 'view' after the prompt
    When I run `ror info render` interactively
    When I type "view"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actionview type 'view' or 'v'"
    And the output should contain "Method: render\n Class: Actionview"

  Scenario: Displays the views render method when I type 'c' after the prompt
    When I run `ror info render` interactively
    And I type "c"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actioncontroller type 'controller' or 'c'"
    And the output should contain "Method: render\n Class: Actioncontroller"

  Scenario: Displays the views render method when I type 'controller' after the prompt
    When I run `ror info render` interactively
    And I type "controller"
    Then the output should contain "Please choose a class for the render method? "
    And the output should contain "Actioncontroller type 'controller' or 'c'"
    And the output should contain "Method: render\n Class: Actioncontroller"
