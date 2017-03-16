Feature: Search for a job

  Scenario: A guest user make a search in an unknown city
    Given I am a guest user
    And I am in "Vietnam" country
    When I make a search in "Tokyo" city
    Then I should see the location not found in the results
    And I should see the search suggestion 'Did you mean "jobs in Tokyo, Japan?"'
    When I click on the search suggestion
    Then I should see some results



