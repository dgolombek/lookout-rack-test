$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../'
require 'rspec'

require 'lookout/rack/test/rspec'
include Lookout::Rack::Test::RSpec

ExpectationNotMetError = RSpec::Expectations::ExpectationNotMetError

require 'examples/test_models'
require 'examples/test_app'

# These methods are tested in setup_spec
configure_rspec
setup_models(TestModels)
setup_routes(TestApp)
