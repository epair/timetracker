Feature: Timetracker

  Scenario: Start tracking time for the given project
    Given an empty file named "~/.timetracker"
    When I run `timetracker start myproject`
    Then the output should contain "Starting work on myproject"
    And the file named "~/.timetracker" should contain:
    """
    myproject
    """
