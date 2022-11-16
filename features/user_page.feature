Feature: Test if user login & sign up page is loaded properly
    As a user, I want the user functionality to work properly

Background: All the regexes and testcases exist

    Given the following regexes exist:
    | title                     | expression                        | created_at                | tag       | description                   | user_id   |
    | Time in 24-hour format    | ([01]?[0-9]\|2[0-3]):[0-5][0-9]   | 2022-10-29 20:04:51 UTC   | time      | Time in 24-hour format.       | 1         |
    | Username                  | [a-zA-Z0-9_-]{3,16}               | 2022-10-29 20:04:51 UTC   | username  | Username of xxx.              | 1         |
    | Email                     | .+@.+                             | 2022-10-29 20:04:51 UTC   | email     | Email address.                | 1         |
    | Negative Integer          | -\d+                              | 2022-10-29 20:04:51 UTC   | number    | Negative integers.            | 1         |
    | Integer                   | -?\d+                             | 2022-10-29 20:04:51 UTC   | number    | Should match all integers.    | 1         |

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

    Given the following users exist:
    | username  | password  |
    | admin     | admin     |
    | test      | test      |

Scenario: Check if Sign Up page is loaded properly
    When I go to the Sign Up page
    Then I should see "Username"
    And I should see "Password"
    And I should see "Password confirmation"
    And I press "Create account"
    Then I should see "can't be blank"

Scenario: Register a new account and log out
    When I go to the Sign Up page
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test123"
    And I press "Create account"
    Then I should see "User center for TestUsername"
    And I go to the Log Out page
    Then I should see "Sign Up"
    And I should not see "User center for TestUsername"

Scenario: Register a new account, confirm with a password that does not match
    When I go to the Sign Up page
    And I fill in "Username" with "TestUsername"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test1234"
    And I press "Create account"
    Then I should see "Password does not match!"

Scenario: Try to register an account with a registered username
    When I go to the Sign Up page
    And I fill in "Username" with "admin"
    And I fill in "Password" with "Test123"
    And I fill in "Password confirmation" with "Test123"
    And I press "Create account"
    Then I should see "Username already taken!"

Scenario: Try to log in with a username that does not exist
    When I go to the Log In page
    And I fill in "Username" with "TestUsername1"
    And I fill in "Password" with "Test1234"
    And I press "Log in"
    Then I should see "User does not exist."

Scenario: Try to log in with a wrong password
    When I go to the Log In page
    And I fill in "Username" with "admin"
    And I fill in "Password" with "Test1234"
    And I press "Log in"
    Then I should see "Wrong password!"

Scenario: Login and view my regex
    When I go to the Log In page
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    Then I should see "User center for admin"
    And I follow "User center for admin"
    Then I should see "These are the regexes that you have uploaded."
