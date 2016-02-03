When /^I (GET|PUT|POST|PATCH|DELETE)( to)? "(.*?)"$/ do |verb, unused, url_path|
  verb = verb.downcase.to_sym
  headers = template_vars['headers'] || {}
  send(verb, render_string(url_path), nil, headers)
end

When /^I (GET|PUT|POST|PATCH|DELETE)( to)? "([^"]*)" with:$/ do |verb, unused, url, params|
  options = {}

  params.hashes.each do |row|
    options[row[:Name]] = render_string(row[:Value])
  end

  verb = verb.downcase.to_sym
  headers = template_vars['headers'] || {}
  send(verb, render_string(url), options, headers)
end

When /^I (GET|PUT|POST|PATCH|DELETE) to "(.*?)" with the JSON:$/ do |verb, url, body|
  verb = verb.downcase.to_sym
  headers = template_vars['headers'] || {}
  send(verb, render_string(url), render_string(body), headers)
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

Then /^the Content\-Type should be "(.*?)"/ do |content_type|
  expect(last_response.headers['Content-Type'].split(';')).to include(content_type)
end

When /^I (PUT|POST) a file to "(.*?)"$/ do |verb, url|
  verb = verb.downcase.to_sym
  send(verb, render_string(url), "some file", template_vars['headers'] || {})
end