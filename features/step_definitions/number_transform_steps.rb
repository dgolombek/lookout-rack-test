Given /^I run a test that expects a number like (-?\d+*)$/ do |the_number|
  @the_number = the_number
end

Then /^it should know that it is a number, not a string$/ do
  expect(@the_number).to be_a Integer
end
