Feature: Test if index page is loaded properly
    As a user, I want the index page loaded properly

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

Scenario: Check if index page is loaded properly
    When I am on the homepage
    Then I should see "Time in 24-hour format"
    And I should see "Username"
    And I should see "Email"
    And I should see "Negative Integer"
    And I should see "Integer"
    And I fill in "textbox 1" with "1234"
    And I press "Check 1"
    Then I should see "No match!"
    And I fill in "textbox 1" with "12:34"
    And I press "Check 1"
    Then I should see "Matches!"

Scenario: Check if the "Add a new regular expression" button works properly
    When I am on the homepage
    And I go to the Add new regular expression page
    Then I should see "Create New regex"
    And I follow "Cancel"
    Then I should see "all of our regexes"
