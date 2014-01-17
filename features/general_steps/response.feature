Feature: Responses

  Scenario: Normal response
    When I GET "/"
    Then the response should be 200

  Scenario: Response with JSON body
    When I GET "/json"
    Then the response should be 200
    And I should receive the JSON:
    """
      { "key" : 1 }
    """

  Scenario: Not found response
    When I GET "/no_such_route"
    Then the response should be 404

  Scenario: Redirect
    When I GET "/redirect"
    Then I should be redirected to "/"
