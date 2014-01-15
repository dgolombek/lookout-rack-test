When /^I (GET|PUT|POST|DELETE)( to)? "(.*?)"$/ do |verb, unused, url_path|
  verb = verb.downcase.to_sym
  send(verb, render_string(url_path))
end

When /^I (GET|POST|PUT)( to)? "([^"]*)" with:$/ do |verb, unused, url, params|
  options = {}

  params.hashes.each do |row|
    options[row[:Name]] = render_string(row[:Value])
  end

  verb = verb.downcase.to_sym
  send(verb, render_string(url), options)
end

When /^I (DELETE|POST) to "(.*?)" with the JSON:$/ do |verb, url, body|
  verb = verb.downcase.to_sym
  send(verb, render_string(url), render_string(body))
end

When /^I POST to "(.*?)" with the param "(.*?)" containing:$/ do |url, param, body|
  options = {param => body}
  post(render_string(url), options)
end

Then /^the response (should be|is) (\d+)$/ do |verb, code|
  expect(last_response.status).to eq(code), "expected #{code} got #{last_response.status} \n\n #{last_response.body}
"
end

Then /^I should be redirected to "([^"]+)"$/ do |path|
  expect(last_response.location).to end_with path
end

Then /^I should receive the JSON:$/ do |json|
  template_vars['timestamp'] = Time.now.utc.iso8601
  expected = JSON.parse(render_string(json))

  begin
    received = JSON.parse(last_response.body)
  rescue JSON::ParserError => e
    raise "Unexpected response: #{last_response.body}\n#{e}"
  end

  expect(received).to eql(expected)
end                                                        
