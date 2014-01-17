Feature: Liquid templates
"""
Note that these also show variable interpolation happening in the response body
"""

  Scenario: Variable interpolation in URI
    When I have set some template variable "foo"
    And I GET "/route/{{foo}}"
    Then the response should be 200
    And I should receive the JSON:
    """
      { "variable" : "{{foo}}" }
    """

  Scenario: Variable interpolation in params
    When I have set some template variable "foo"
    And I POST to "/" with:
      | Name        | Value   |
      | some_param  | {{foo}} |
      | im_a_number | 1       |
    Then the response should be 201
    And I should receive the JSON:
    """
      {
        "some_param" : "{{foo}}",
        "im_a_number" : "1"
      }
    """

  Scenario: Variable interpolation in JSON body
    When I have set some template variable "foo"
    And I POST to "/json" with the JSON:
    """
      {
        "some_var" : "{{foo}}"
      }
    """
    Then the response should be 201
    And I should receive the JSON:
    """
      {
        "some_var" : "{{foo}}"
      }
    """
