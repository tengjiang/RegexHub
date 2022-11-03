# RegexHub
Project for Engineering SaaS. A platform to share and get regular expressions in Ruby.

# Instructions:
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
