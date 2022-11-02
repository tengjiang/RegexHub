Feature: test if regex works
    As a user, I want to test an existing regex by myself 
    and see if it works

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

Scenario: test an existing regex with success test case
    When I go to the details page for "Time in 24-hour format"

    And I fill in "Type something." with "12:34"

    And I press "Check"

    Then I should see "match"

Scenario: test an existing regex with failed test case
    When I go to the details page for "Time in 24-hour format"

    And I fill in "Type something." with "25:87"

    And I press "Check"

    Then I should see "No match"