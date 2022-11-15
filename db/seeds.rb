# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

regex = [{:title => 'Time in 24-hour format', :expression => '^([01]?[0-9]|2[0-3]):[0-5][0-9]$', :description => 'Time in 24-hour format.', :tag => 'time', :user_id => 1},
    	 {:title => 'Username', :expression => '^[a-zA-Z0-9_-]{3,16}$', :description => 'Username of xxx.', :tag => 'username', :user_id => 1},
    	 {:title => 'Email', :expression => '^.+@.+$', :description => 'Email address.', :tag => 'email', :user_id => 1},
      	 {:title => 'Negative Integer', :expression => '^-\d+$', :description => 'Negative integers.', :tag => 'number', :user_id => 1},
      	 {:title => 'Integer', :expression => '^-?\d+$', :description => 'Should match all integers.', :tag => 'number', :user_id => 1},
  	 	]

testcases = [{:regex_id => 1, :match => 'true', :content => '23:59'},
			 {:regex_id => 1, :match => 'false', :content => '25:64'},
			 {:regex_id => 2, :match => 'true', :content => 'real_id'},
			 {:regex_id => 2, :match => 'false', :content => 'fake^id'},
			 {:regex_id => 3, :match => 'true', :content => 'test@test.com'},
			 {:regex_id => 3, :match => 'false', :content => 'notanemail'},
			 {:regex_id => 4, :match => 'true', :content => '-42'},
			 {:regex_id => 4, :match => 'false', :content => '56'},
			 {:regex_id => 5, :match => 'true', :content => '345'},
			 {:regex_id => 5, :match => 'false', :content => 'asda'},
			]
		
users = [{:username => 'admin', :password => 'admin' }]

regex.each do |regex|
  Regex.create!(regex)
end

testcases.each do |testcase|
	Testcase.create!(testcase)
end

users.each do |user|
	User.create!(user)
end