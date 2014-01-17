Feature: Requests with no body or params

  Scenario: I should be able to GET a route, and check the response status
    When I GET "/"
    Then the response should be 200

  Scenario: I should be able to POST to a route, and check the response status
    When I POST to "/"
    Then the response should be 201

  Scenario: I should be able to PUT to a route, and check the response status
    When I PUT to "/"
    Then the response should be 202
