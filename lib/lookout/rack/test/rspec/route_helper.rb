require 'lookout/rack/test'

module Lookout::Rack::Test::RSpec
    module RouteHelper
      def app
        return @app if @app

        klass = ::Lookout::Rack::Test.app || $application_class
        @app = klass.new
      end
    end
end
