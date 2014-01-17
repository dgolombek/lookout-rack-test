Feature: Timefreeze and liquid templates
"""
  This test does not happen in frozen time because it is not tagged @timefreeze - it is here to serve as a contrast to timefreeze.feature
"""

  Scenario: Timecop.freeze
    Given I know the time the test started
    When I GET "/time"
    Then I should not receive the JSON:
    """
      {
        "time" : "{{time}}"
      }
    """
