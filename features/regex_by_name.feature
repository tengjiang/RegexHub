Feature: search for regex by name
    As a user, I want to search a regex by name
Background: regex have been added to database

    Given the following regex exist:
    | title                     | expression                            | description               | tags      |
    | Time in 24-hour format    | /^([01]?[0-9]\|2[0-3]):[0-5][0-9]$/   | Time in 24-hour format    | time      |
    | Username                  | /^[a-zA-Z0-9_-]{3,16}$/               | Username                  | username  |
    | Email                     | /^.+@.+$/                             | Email                     | email     |
    | Negative Integer          | /^-\d+$/                              | Negative Integer          | number    |
    | Integer                   | /^-?\d+$/                             | Integer                   | number    |

    And I am on the RegexHub home page
    Then 5 seed regex should exist

Scenario: 
