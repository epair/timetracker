Feature: Stop
  @in-process
  Scenario: Run command
    Given I've starting tracking for "myproject"
    When I run `timetracker stop myproject`
    Then the output should contain "Stopping work on myproject"
    And creates an entry with a stop status
