require 'rack/test'
require 'lookout/rack/test'

module Lookout::Rack::Test::Cucumber
  module Server
    def app
      return @app if @app

      klass = ::Lookout::Rack::Test.app || $application_class
      @app = klass.new if klass
    end
  end
end

World(Lookout::Rack::Test::Cucumber)
