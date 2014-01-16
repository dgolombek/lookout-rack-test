require 'rspec'
require 'rack/test'
require 'timecop'

require 'lookout/rack/test/rspec/email_helpers'
require 'lookout/rack/test/rspec/fake_request'
require 'lookout/rack/test/rspec/model_examples'

module Lookout
  module Rack
    module Test
      module RSpec
        # Takes one argument, the Models class (or module) that has a .setup and
        # .unsetup method
        def setup_models(models)
          ::RSpec.configure do |c|
            c.around(:each, :speed => :slow) do |example|
              models.setup
              example.run
              models.unsetup
            end
      
            c.before(:all, :speed => :slow) do
              require 'lookout/rack/test/load_factories'
            end
          end
        end
  
        # Takes one argument, the application (e.g., SinatraApplication)
        def setup_routes(application)
          ::RSpec.configure do |c|
            c.include(::Rack::Test::Methods, :type => :route)
  
            require 'lookout/rack/test/rspec/route_helper'
            $application_class = application
            c.include(::RouteHelper, :type => :route)
          end
        end
  
        def configure_rspec
          ::RSpec.configure do |c|
            c.around(:each, :timefreeze => true) do |example|
              ::Timecop.freeze do
                example.run
              end
            end
          end
        end
      end
    end
  end
end
