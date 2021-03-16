Feature: Stop

  @in-process
  Scenario: Run stop command with project
    Given I've starting tracking for "myproject"
    When I run `timetracker stop myproject`
    Then the output should contain "Stopping work on myproject"
    And creates an entry with a project with a stop status

  @in-process
  Scenario: Run stop command with tag
    Given I've starting tracking for "myproject" "@testing"
    When I run `timetracker stop @testing`
    Then the output should contain "Stopping work on @testing, continuing work on myproject"
    And creates an entry with a tag with a stop status

  @in-process
  Scenario: Run stop command with multiple tags
    Given I've starting tracking for "myproject" "@testing" "@pairing"
    When I run `timetracker stop @testing @pairing`
    Then the output should contain "Stopping work on [@testing, @pairing], continuing work on myproject"
    And creates an entry with a tag with a stop status
