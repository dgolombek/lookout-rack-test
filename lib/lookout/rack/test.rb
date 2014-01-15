require 'lookout/rack/test/version' 

require 'rspec'
require 'rack/test'
require 'timecop'

require 'lookout/rack/test/email_helpers'
require 'lookout/rack/test/request_helper'
require 'lookout/rack/test/model_examples'


module Lookout
  module Rack
    module Test

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
            unless $factories_loaded
              require 'factory_girl'
              ::FactoryGirl.find_definitions
              $factories_loaded = true
            end
          end
        end
      end

      # Takes one argument, the application (e.g., SinatraApplication)
      def setup_routes(application)
        ::RSpec.configure do |c|
          c.include(::Rack::Test::Methods, :type => :route)

          require 'lookout/rack/test/route_helper'
          $application_class = application
          c.include(::RouteHelper, :type => :route)
        end
      end

      def configure_rspec
        ::RSpec.configure do |c|
          c.before(:each, :timefreeze => true) do
            ::Timecop.freeze
          end
        end
      end
    end
  end
end
