Feature: Start
  @in-process
  Scenario: Run start command
    When I run `timetracker start myproject @testing`
    Then the output should contain "Starting work on myproject [@testing] at 10:04AM"
    And creates an entry with a start status
    And creates an entry tag called @testing
