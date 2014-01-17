Feature: Transform of numbers

  Scenario: A test containing a number
    When I run a test that expects a number like 123
    Then it should know that it is a number, not a string
