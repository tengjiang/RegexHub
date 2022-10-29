# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

regex = [{:title => 'Time in 24-hour format', :expression => '/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/', :description => 'Time in 24-hour format', tags => 'time'},
    	  {:title => 'Username', :expression => '/^[a-zA-Z0-9_-]{3,16}$/', :description => 'Username', tags => 'username'},
    	  {:title => 'Email', :expression => '/^.+@.+$/', :description => 'Email', tags => 'email'},
      	  {:title => 'Negative Integer', :expression => '/^-\d+$/', :description => 'Negative Integer', tags => 'number'},
      	  {:title => 'Integer', :expression => '/^-?\d+$/', :description => 'Integer', tags => 'number'},
  	 ]

regex.each do |regex|
  Regex.create!(regex)
end