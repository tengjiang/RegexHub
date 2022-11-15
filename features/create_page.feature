Feature: Test if create page is loaded properly
    As a user, I want the create page loaded properly

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

    When I go to the Add new regular expression page
    Then I should see "You have to log in first to submit a regex!"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    Then I should see "Welcome, dear admin"

Scenario: Try to add a new test case and delete it
    And I go to the Add new regular expression page
    Then I should see "testcase 1"
    And I should not see "testcase 2"
    And I press "Add testcase"
    Then I should see "testcase 2"
    And I check "delete testcase 2"
    And I press "Delete checked testcases"
    Then I should not see "testcase 2"

Scenario: Try to delete the only testcase
    When I go to the Add new regular expression page
    And I should see "testcase 1"
    And I check "delete testcase 1"
    And I press "Delete checked testcases"
    Then I should see "Must have at least one testcase!"

Scenario: Add a new regex with no name input
    When I go to the Add new regular expression page
    And I fill in "Expression" with "/^\d*\.?\d+$/"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "number"
    And I fill in "testcase 1" with "qwadasd"
    And I choose "testcase 1 false"
    And I press "Save Changes"
    Then I should see "Regex must have name!"
    
Scenario: Add a new regex with no expression input
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "number"
    And I fill in "testcase 1" with "qwadasd"
    And I choose "testcase 1 false"
    And I press "Save Changes"
    Then I should see "Regex must have expression!"

Scenario: Add a new regex with no testcase
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number"
    And I fill in "Expression" with "/^\d*\.?\d+$/"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "number"
    And I press "Save Changes"
    Then I should see "All regexes must specify expected match result!"

Scenario: Add a new regex with wrong testcase result
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number"
    And I fill in "Expression" with "/^\d*\.?\d+$/"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "number"
    And I fill in "testcase 1" with "qwadasd"
    And I choose "testcase 1 true"
    And I press "Save Changes"
    Then I should see "Regex No.1 does not behave as expected."

Scenario: Add a new regex and save
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number"
    And I fill in "Expression" with "/^\d*\.?\d+$/"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "number"
    And I fill in "testcase 1" with "qwadasd"
    And I choose "testcase 1 false"
    And I press "Save Changes"
    Then I am on the homepage
    And I should see "Time in 24-hour format"
    And I should see "Username"
    And I should see "Email"
    And I should see "Negative Integer"
    And I should see "Integer"
    And I should see "Positive number"

Scenario: Add a new regex with new tag and save
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number 1"
    And I fill in "Expression" with "/^\d*\.?\d+$/"
    And I fill in "Description" with "Should match all positive numbers"
    And I fill in "Tag" with "test_new_tag"
    And I fill in "testcase 1" with "qwadasd"
    And I choose "testcase 1 false"
    And I press "Save Changes"
    Then I am on the homepage
    And I should see "Time in 24-hour format"
    And I should see "Username"
    And I should see "Email"
    And I should see "Negative Integer"
    And I should see "Integer"
    And I should see "Positive number 1"

Scenario: Add a new regex and not save
    When I go to the Add new regular expression page
    And I fill in "Name" with "Positive number"
    And I fill in "Expression" with "^\d*\.?\d+$"
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

Scenario: Try to delete others regex
    When I go to the Log Out page
    And I go to the Log In page
    And I fill in "Username" with "test"
    And I fill in "Password" with "test"
    And I press "Log in"
    When I go to the details page for "Time in 24-hour format"
    Then I should not see "Delete"
