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


Scenario: add a title and delete it
  Given I am on the RegexHub home page
  And I follow "Add new regex"
  Then I should be on the new regex page
  When I fill in "Title" with "Moon Man"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the regex home page
  And I should see "Moon Man was successfully created"
  When I follow "More about Moon Man"
  Then I should be on the details page for "Moon Man"
  When I follow "Delete"
  Then I should be on the RottenPotatoes home page
  And I should see "Movie 'Moon Man' deleted."
