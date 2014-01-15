module Lookout::Rack::Test
    module RouteHelper
      def app
        @app ||= $application_class.new if $application_class
      end
    end
end
