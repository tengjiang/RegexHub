Feature: display list of regexes filtered by tags
    As a user, I want to quickly browse Regexes
    I want to see Regexes matching only certain tags

Background: regexes have been added to database

  Given the following regexes exist:
  | title                     | expression                        | created_at                | tag       | description                   |
  | Time in 24-hour format    | ([01]?[0-9]\|2[0-3]):[0-5][0-9]   | 2022-10-29 20:04:51 UTC   | time      | Time in 24-hour format.       |
  | Username                  | [a-zA-Z0-9_-]{3,16}               | 2022-10-29 20:04:51 UTC   | username  | Username of xxx.              |
  | Email                     | .+@.+                             | 2022-10-29 20:04:51 UTC   | email     | Email address.                |
  | Negative Integer          | -\d+                              | 2022-10-29 20:04:51 UTC   | number    | Negative integers.            |
  | Integer                   | -?\d+                             | 2022-10-29 20:04:51 UTC   | number    | Should match all integers.    |

  And I am on the RegexHub home page
  Then 5 seed regexes should exist

Scenario: restrict to regexes with "time" or "number" tags
  When I check the following tags: time, number
  And I uncheck the following tags: username, email
  And I press "Refresh"
  And I should see "Time in 24-hour format"
  And I should see "Negative Integer"
  And I should see "Integer"
  And I should not see "title"
  And I should not see "Username"
  And I should not see "Email"

Scenario: all tags selected
  When I check the following tags: time, username, email, number
  And I press "Refresh"
  Then I should see all the regexes
