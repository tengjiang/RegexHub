Feature: add a new regex
    As a user, I want to add a new regex by myself

Background: I am on the homepage and I can see all regexes

    Given the following regexes exist:
    | title                     | expression                        | created_at                | tag       | description                   |
    | Time in 24-hour format    | ([01]?[0-9]\|2[0-3]):[0-5][0-9]   | 2022-10-29 20:04:51 UTC   | time      | Time in 24-hour format.       |
    | Username                  | [a-zA-Z0-9_-]{3,16}               | 2022-10-29 20:04:51 UTC   | username  | Username of xxx.              |
    | Email                     | .+@.+                             | 2022-10-29 20:04:51 UTC   | email     | Email address.                |
    | Negative Integer          | -\d+                              | 2022-10-29 20:04:51 UTC   | number    | Negative integers.            |
    | Integer                   | -?\d+                             | 2022-10-29 20:04:51 UTC   | number    | Should match all integers.    |

    And I am on the homepage

    Then I should see "Time in 24-hour format"

    And I should see "Username"

    And I should see "Email"

    And I should see "Negative Integer"

    And I should see "Integer"
    
Scenario: add a new regex and save
    When I go to the Add new regular expression page

    And I fill in "Name" with "Positive number"

    And I fill in "Expression" with "/^\d*\.?\d+$/"

    And I fill in "Description" with "Should match all positive numbers"

    And I fill in "Tag" with "number"

    And I press "Save Changes"

    Then I am on the homepage

    And I should see "Time in 24-hour format"

    And I should see "Username"

    And I should see "Email"

    And I should see "Negative Integer"

    And I should see "Integer"

    And I should see "Positive number"

Scenario: add a new regex and not save
    When I go to the Add new regular expression page

    And I fill in "Name" with "Positive number"

    And I fill in "Expression" with "/^\d*\.?\d+$/"

    And I fill in "Description" with "Should match all positive numbers"

    And I fill in "Tag" with "number"

    And I follow "Cancel"

    Then I am on the homepage

    And I should see "Time in 24-hour format"

    And I should see "Username"

    And I should see "Email"

    And I should see "Negative Integer"

    And I should see "Integer"

    And I should not see "Positive number"
