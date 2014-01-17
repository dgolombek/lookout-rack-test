When /^I have set some template variable "(.*?)"$/ do |var_name|
  template_vars[var_name] = rand(1000).to_s
end
