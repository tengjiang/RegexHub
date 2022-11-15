Feature: Test if user login & sign up page is loaded properly
    As a user, I want the user functionality to work properly

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

Scenario: Check if Sign Up page is loaded properly
    When I go to the Sign Up page
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test123"
    And I press "Create account"
    Then I should see "Welcome, dear TestUsername"
    And I go to the Log Out page
    Then I should see "Sign Up"
    And I should not see "Welcome, dear TestUsername"
    And I go to the Sign Up page
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test1234"
    And I press "Create account"
    Then I should see "Password does not match!"
    And I go to the Sign Up page
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test123"
    And I press "Create account"
    Then I should see "Username already taken!"
    And I go to the Log In page
    And I fill in "Username" with "TestUsername1"
    And I fill in "Password" with "Test1234"
    And I press "Log in"
    Then I should see "User does not exist."
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test1234"
    And I press "Log in"
    Then I should see "Wrong password!"
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I press "Log in"
    Then I should see "Welcome, dear TestUsername"
    And I follow "Welcome, dear TestUsername"
    Then I should see "These are the regexes that you have uploaded."
