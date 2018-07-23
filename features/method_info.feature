Feature: Display method render
  As a CLI
  In order to view a methods syntax
  I want to display information on any given method

  Scenario: Display render method
    When I run `ror m render`
    Then the output should contain "Which render method?"

  Scenario: Display Actionviews render method
    When I run `ror m render view`
    Then the output should contain "partial: '<relative_file_name>'"

  Scenario: Responds to invalid klass option
    When I run `ror m render DHH`
    Then the output should contain "Undefined class option: Use 'ror m METHOD' to view class options."

  Scenario: Display Actioncontrollers render method
    When I run `ror m render controller`
    Then the output should contain "render '<:view>'"
