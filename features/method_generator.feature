Feature: I can make programming easier
  As a user
  So that I can add new descriptions
  I want to generate the needed files and code

  Scenario: Generate text files for appropriate classes
    When I run `ror new_method bob actioncontroller actionview`
    Then the following files should exist:
      | lib/ror/method_descriptions/actioncontroller/bob.txt | lib/ror/method_descriptions/actionview/bob.txt |
    And the file "lib/ror/method_descriptions/actioncontroller/bob.txt" should contain:
      """
      Method: bob
       Class: Actioncontroller

      Syntax: TODO: (Fill in method syntax)

      Description: TODO: (Fill in short description)

      Params: TODO: (Fill in and explain Params)

      Options: TODO: (Fill in and explain any available options)

      Examples: TODO: (Please provide some examples)

      Link to documentation: TODO: (Insert a direct link to the documentation for this
                                    method. Preferably the rails guide, api or both!)
      """
    And the file "lib/ror/method_descriptions/actionview/bob.txt" should contain:
      """
      Method: bob
       Class: Actionview

      Syntax: TODO: (Fill in method syntax)

      Description: TODO: (Fill in short description)

      Params: TODO: (Fill in and explain Params)

      Options: TODO: (Fill in and explain any available options)

      Examples: TODO: (Please provide some examples)

      Link to documentation: TODO: (Insert a direct link to the documentation for this
                                    method. Preferably the rails guide, api or both!)
      """
