Feature: Stop
  @in-process
  Scenario: Run command
    When I run `timetracker stop myproject`
    Then the output should contain "Stopping work on myproject"
    And creates an entry with a stop status
