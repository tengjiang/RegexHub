Feature: search for regex by tags
    As a user, I want to search a regex by tags

Background: regex have been added to database

    Given the following regex exist:
    | title                     | expression                            | description               | tags      |
    | Time in 24-hour format    | /^([01]?[0-9]\|2[0-3]):[0-5][0-9]$/   | Time in 24-hour format    | time      |
    | Username                  | /^[a-zA-Z0-9_-]{3,16}$/               | Username                  | username  |
    | Email                     | /^.+@.+$/                             | Email                     | email     |
    | Negative Integer          | /^-\d+$/                              | Negative Integer          | number    |
    | Integer                   | /^-?\d+$/                             | Integer                   | number    |

    And I am on the RegexHub home page
    Then I should see all the regex

Scenario: restrict to regex with "time" or "number" tags
    When I check the following tags: time, number

    And I uncheck the following tags: username, email

    And I press "Refresh"

    Then I should see the following regex: Time in 24-hour format, Negative Integer, Integer

    And I should not see the following regex: Username, Email

Scenario: all tags selected

    When I check the following tags: time, username, email, number
    
    And I press "Refresh"

    Then I should see all the regex
