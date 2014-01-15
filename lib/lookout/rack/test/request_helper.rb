require 'rspec'

module Lookout::Rack::Test
  class FakeRequestClass
    attr_accessor :session, :env, :request
    
    def initialize
      @session = {}
      @env = {}
      @request = Object.new
      @request.stub(:path_info).and_return('')
    end
  
    def redirect(path, params={}); end # So we can catch calls to the redirect method
  
    def halt(status, error_string); end
  
    def to(url); url; end
  end
end
