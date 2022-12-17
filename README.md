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
* We have added one more set of features: Like and Unlike to complete our user journey. This is done by adding a new relation “like” in our database schema, with foreign key regex_id referring to a particular regex, and user_id referring to the user that liked this regex. 
  * Going into a page of one regex, users can see how many likes this regex has and they can click on the Like button to give this regex a “like”.
  * If users have liked this regex before, they can “unlike” it by clicking on the Unlike button.
  * Users can see all the regexes they liked in the user center.
* We improved the tagging system by allowing multiple tags for one regex:
  * Tags are separated by commas, and spaces at the start and end of each tag will be stripped.
  * Users can check the checkboxes of categories they want to view on the homepage and refresh to see regexes with at least one of those categories.
  * If a new regular expression is uploaded with no tags, it will be marked “other”.
  * If a new regular expression is uploaded with one or more different tags than any other tags our regexes have, it will automatically create the according tags and mark their according checkbox selected when going back to the homepage.
* We add support for editing regex after users have uploaded their regexes.
  * The Edit button is now available in the user center and the regex page, along with the delete button.
  * Specifically, users can reset the regex’s description and tags. After successfully editions, users will be redirected to the home page and see the tags have already been updated.
* Other minor functions:
  * We added more buttons to edit/delete regexes.
  * We added the Refresh button to reset all the tags we have selected.
