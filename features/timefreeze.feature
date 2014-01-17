@timefreeze
Feature: Timefreeze and liquid templates
"""
  This test happens in frozen time because it is tagged @timefreeze
"""

  Scenario: Timecop.freeze
    Given I know the time the test started
    When I GET "/time"
    Then I should receive the JSON:
    """
      {
        "time" : {{time}}
      }
    """
