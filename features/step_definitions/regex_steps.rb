Given /the following regexes exist/ do |regex_table|
    regex_table.hashes.each do |regex|
      Regex.create regex
    end
    # pending "Fill in this step in regex_steps.rb"
  end



When /I (un)?check the following tags: (.*)/ do |uncheck, tags|
    tags.split(', ').each do |tag|
      step %{I #{uncheck.nil? ? '' : 'un'}check "tags_#{tag}"}
    end
    # pending "Fill in this step in regex_steps.rb"
  end

Then /I should see all the regex/ do
  Regex.all.all.each do |regex|
        step %{I should see "#{regex.title}"}
    end
    # pending "Fill in this step in regex_steps.rb"
end