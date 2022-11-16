# RegexHub
Project for Engineering SaaS. A platform to share and get regular expressions in Ruby.

# Instructions
* Run bundle install to make sure all gems are properly installed. We are using Ruby with version 2.6.6, and Rails with version 4.2.10:
 ```bundle install --without production```
* Create the database schema and populate the initial data:
```bundle exec rake db:migrate```
```bundle exec rake db:seed```
* Run RSpec tests:
```rake spec```
* Run Cucumber tests:
```rake cucumber```
* Start the app in a terminal:
```bundle exec rails server```
* Visit the app’s home page:
```localhost:3000/```

# Features we added for iter-2
* We have added a brand new user system for our application. Feel free to try it out with username “admin” and password “admin”, or create your own user with a different username.
  * Common authorization logics, like log-in and register, are fully supported. Usernames cannot duplicate, and passwords must match to register or log in.
  * Now, only users who have logged in can upload regexes. If users try to create a new regular expression without logging in, they will be prompted to the user log-in page.
  * Now users can click into their user center to see all the regexes they have uploaded. 
  * Now users can only delete the regexes they uploaded but not others uploaded, both in their user center and the regular expression homepage.
* We improved the tagging system with checkboxes to select and show regexes with according tags.
  * Users can check the checkboxes of categories they want to view on the homepage and refresh to see regexes with those categories.
  * If a new regular expression is uploaded with an empty tag, it will be marked “other”.
  * If a new regular expression is uploaded with a different tag than any other tags our regexes have, it will automatically create a new tag and mark its according checkbox selected when going back to the homepage.
* Other minor functions:
  * We enforce test cases not to duplicate when uploading test cases on each page of regex.
  * We add support to check for matching results on the front page.

