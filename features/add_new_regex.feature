Feature: add a new regex
    As a user, I want to add a new regex by myself

Background: I am on the homepage and I can see all regexes

    Given I am on the homepage

    Then I should see "All Regexes"


Scenario: add a new regex
    When I go to the Add new regular expression page

    And I fill in "Name" with "Positive number"

    And I fill in "Expression" with "/^\d*\.?\d+$/"

    And I fill in "Description" with "Should match all positive numbers"

    And I fill in "Tag" with "number"

    And I press "Save Changes"

    Then I am on the homepage

    And I should see "Positive number"
