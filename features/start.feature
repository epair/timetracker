Feature: Start
  @in-process
  Scenario: Run start command
    When I run `timetracker start myproject`
    Then the output should contain "Starting work on myproject at 10:04AM"
    And creates an entry with a start status

  @in-process
  Scenario: Run start command with tag
    When I run `timetracker start myproject @testing`
    Then the output should contain "Starting work on myproject, @testing at 10:04AM"
    And creates an entry with a start status
    And creates an entry tag called @testing

  @in-process
  Scenario: Run start command with multiple tags
    When I run `timetracker start myproject @testing @pairing`
    Then the output should contain "Starting work on myproject, @testing, @pairing at 10:04AM"
    And creates an entry with a start status
    And creates an entry tag called @testing
    And creates an entry tag called @pairing

  @in-process
  Scenario: Run start command with multiple tags and notes
    When I run `timetracker start myproject @testing @pairing working with Emmett`
    Then the output should contain "Starting work on myproject, @testing, @pairing at 10:04AM"
    And creates an entry with a start status and notes
    And creates an entry tag called @testing
    And creates an entry tag called @pairing
