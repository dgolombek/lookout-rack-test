require 'lookout/rack/test/version'

module Lookout
  module Rack
    module Test
      @@app = nil
 
      def self.app=(application_class)
        @@app = application_class
      end

      def self.app
        @@app
      end
    end
  end
end
