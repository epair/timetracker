Feature: Projects
  @in-process
  Scenario: Run tags command
    Given I've logged a project called "myproject"
    And two tags called "@testing" and "@waiting"
    When I run `timetracker tags`
    Then the output should contain:
    """
    @testing
    @waiting
    """
