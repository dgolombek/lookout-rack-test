# Lookout::Rack::Test

RSpec and Cucumber test helpers.

## Installation

Add this line to your application's Gemfile:

    gem 'lookout-rack-test'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lookout-rack-test

## Usage

`Lookout::Rack::Test` is intended to be consumed in pieces; it falls into three
modules, `RSpec`, `Cucumber`, and `Rake`.

### RSpec
See examples in `spec/`.  `Lookout::Rack::Test::RSpec::FakeRequest` may also be
helpful, if you want to test helper modules that are intended to be mixed into a
route environment.

```ruby
  module Lookout::Rack::Test::RSpec
    class FakeRequest
      # Reopen the class to add a helper
      include My::Helper
    end
  end

  describe My::Helper do
    let(:helper) { Lookout::Rack::Test::RSpec::FakeRequest.new }

    # ... etc
  end
```

### Cucumber
See examples in `features/`.

### Rake tasks
  `require 'lookout/rack/test/rake' in your Rakefile to pick up the RSpec and
Cucumber test tasks, namespaced under `:spec` and `:cucumber` respectively.

Note that the `:cucumber` tasks require a `cucumber.yml`, e.g.: 

```yml
<%
standard = "--expand -r features --format pretty --format junit --out features/reports"
browser_opts = "--tags @selenium"
%>

default: <%= standard %> <%= browser_opts %> --tags ~@wip --tags ~@api
wip: <%= standard %> --tags @wip
api: <%= standard %> --tags @api --tags ~@wip
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
