Feature: delete an existing regex
    As a user, I want to delete an existing regex by myself

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

Scenario: delete an existing regex and save
    When I go to the details page for "Username"

    And I follow "Delete"

    Then I am on the homepage

    And I should see "Time in 24-hour format"

    And I should see "Email"

    And I should see "Negative Integer"

    And I should see "Integer"

    And I should not see "Username"

Scenario: delete an existing regex and not save
    When I go to the details page for "Username"

    And I follow "Back to homepage"

    Then I am on the homepage

    And I should see "Time in 24-hour format"

    And I should see "Username"

    And I should see "Email"

    And I should see "Negative Integer"

    And I should see "Integer"
