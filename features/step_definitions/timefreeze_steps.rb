Given /^I know the time the test started$/ do
  template_vars['time'] = Time.now.to_i
end

Then /^I should not receive the JSON:$/ do |json|
  target = JSON.parse(render_string(json))

  begin
    received = JSON.parse(last_response.body)
  rescue JSON::ParserError => e
    raise "Unexpected response: #{last_response.body}\n#{e}"
  end

  expect(received).not_to eql(target)
end
