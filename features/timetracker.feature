Feature: Timetracker

  Scenario: Start tracking time for the given project
    When I run `timetracker start myproject`
    Then the output should contain "Starting work on myproject"
    And an entry for myproject should be created
