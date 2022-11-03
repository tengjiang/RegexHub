Feature: Test if detail page is loaded properly
    As a user, I want the detail page loaded properly

Background: All the regexes and testcases exist

    Given the following regexes exist:
    | title                     | expression                        | created_at                | tag       | description                   |
    | Time in 24-hour format    | ([01]?[0-9]\|2[0-3]):[0-5][0-9]   | 2022-10-29 20:04:51 UTC   | time      | Time in 24-hour format.       |
    | Username                  | [a-zA-Z0-9_-]{3,16}               | 2022-10-29 20:04:51 UTC   | username  | Username of xxx.              |
    | Email                     | .+@.+                             | 2022-10-29 20:04:51 UTC   | email     | Email address.                |
    | Negative Integer          | -\d+                              | 2022-10-29 20:04:51 UTC   | number    | Negative integers.            |
    | Integer                   | -?\d+                             | 2022-10-29 20:04:51 UTC   | number    | Should match all integers.    |

    Given the following testcases exist:
    | regex_id  | match | content       |
    | 1         | true  | 23:59         |
    | 1         | false | 25:64         |
    | 2         | true  | real_id       |
    | 2         | false | fake^id       |
    | 3         | true  | test@test.com |
    | 3         | false | notanemail    |
    | 4         | true  | -42           |
    | 4         | false | 56            |
    | 5         | true  | 345           |
    | 5         | false | asda          |

Scenario: Check if the test case is loaded properly
    When I go to the details page for "Time in 24-hour format"
    Then I should see "23:59"
    And I should see "25:64"

Scenario: Check try it out function with empty input
    When I go to the details page for "Time in 24-hour format"
    And I press "Check"
    Then I should see "No input"

Scenario: Check try it out function with a match input
    When I go to the details page for "Time in 24-hour format"
    And I fill in "Type something." with "12:34"
    And I press "Check"
    Then I should see "Matches!"

Scenario: Check try it out function with a mismatch input
    When I go to the details page for "Time in 24-hour format"
    And I fill in "Type something." with "25:87"
    And I press "Check"
    Then I should see "No match!"

Scenario: Add a new empty test case
    When I go to the details page for "Time in 24-hour format"
    And I press "Add to testcase"
    Then I should not see "Testcase successfully added!"

Scenario: Add a new true test case
    When I go to the details page for "Time in 24-hour format"
    And I fill in "Type something." with "12:34"
    And I press "Add to testcase"
    Then I should see "Testcase successfully added!"
    And I should see "true"

Scenario: Add a new false test case
    When I go to the details page for "Time in 24-hour format"
    And I fill in "Type something." with "12abc34"
    And I press "Add to testcase"
    Then I should see "Testcase successfully added!"
    And I should see "false"

Scenario: Delete a regex
    When I go to the details page for "Time in 24-hour format"
    And I follow "Delete"
    Then I should be on the homepage
    And I should see "Regex 'Time in 24-hour format' deleted."

Scenario: Return to homepage
    When I go to the details page for "Time in 24-hour format"
    And I follow "Back to homepage"
    Then I should be on the homepage
    