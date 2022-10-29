# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

regex = [{:title => 'Time in 24-hour format', :expression => '/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/', :description => 'Time in 24-hour format.', :tag => 'time'},
    	  {:title => 'Username', :expression => '/^[a-zA-Z0-9_-]{3,16}$/', :description => 'Username of xxx.', :tag => 'username'},
    	  {:title => 'Email', :expression => '/^.+@.+$/', :description => 'Email address.', :tag => 'email'},
      	  {:title => 'Negative Integer', :expression => '/^-\d+$/', :description => 'Negative integers.', :tag => 'number'},
      	  {:title => 'Integer', :expression => '/^-?\d+$/', :description => 'Should match all integers.', :tag => 'number'},
  	 ]

regex.each do |regex|
  Regex.create!(regex)
end