require 'rack/test'

module Lookout::Rack::Test::Cucumber
  module Server
    def app
      @app ||= $application_class.new if $application_class
    end
  end
end

World(Lookout::Rack::Test::Cucumber)
