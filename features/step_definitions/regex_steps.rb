Given /the following regexes exist/ do |regex_table|
    regex_table.hashes.each do |regex|
      Regex.create regex
    end
    # pending "Fill in this step in regex_steps.rb"
end

Given /the following testcases exist/ do |testcase_table|
  testcase_table.hashes.each do |testcase|
    Testcase.create testcase
  end
  # pending "Fill in this step in regex_steps.rb"
end

Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    User.create user
  end
  # pending "Fill in this step in regex_steps.rb"
end

When /I (un)?check the following tags: (.*)/ do |uncheck, tags|
    tags.split(', ').each do |tag|
      step %{I #{uncheck.nil? ? '' : 'un'}check "tags_#{tag}"}
    end
    # pending "Fill in this step in regex_steps.rb"
  end

When /I check the following statements: (.*)/ do |statement|
    radio_button()
end

Then /I should see all the regex/ do
  Regex.all.all.each do |regex|
        step %{I should see "#{regex.title}"}
    end
    # pending "Fill in this step in regex_steps.rb"
end

Then /(.*) seed regexes should exist/ do | n_seeds |
  Regex.count.should be n_seeds.to_i
end
