Feature: Projects
  @in-process
  Scenario: Run projects command
    Given I've logged two projects named "myproject1" and "myproject2"
    When I run `timetracker projects`
    Then the output should contain:
    """
    myproject1
    myproject2
    """
