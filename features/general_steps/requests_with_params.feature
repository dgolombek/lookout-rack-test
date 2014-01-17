Feature: Requests with params, JSON response

  Scenario: POST with params
    When I POST to "/" with:
      | Name        | Value      |
      | some_param  | some_value |
      | im_a_number | 1          |
    Then the response should be 201
    And I should receive the JSON:
    """
      { "some_param" : "some_value",
        "im_a_number" : "1"
      }
    """

  Scenario: PUT with params
    When I PUT to "/" with:
      | Name        | Value      |
      | some_param  | some_value |
      | im_a_number | 1          |
    Then the response should be 202
    And I should receive the JSON:
    """
      { "some_param" : "some_value",
        "im_a_number" : "1"
      }
    """
