Feature: Requests with JSON body

  Scenario: POST with JSON body
    When I POST to "/json" with the JSON:
    """
      { "some_key" : "some_value" }
    """
    Then the response should be 201

  Scenario: DELETE with JSON body
    When I DELETE to "/json" with the JSON:
    """
      { "some_key" : "some_value" }
    """
    Then the response should be 203
