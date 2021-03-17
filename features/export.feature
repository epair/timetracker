Feature: Export
  @in-process
  Scenario: Run export command
    Given that I've used the app for tracking
    When I run `timetracker export`
    Then the output should contain "Exporting data as CSV"
    And a file named "timetracker_data.csv" should exist
    And the file "timetracker_data.csv" should contain:
    """
    created_at,status,project,tags,notes
    """
