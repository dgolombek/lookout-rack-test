require 'rack/test'
require 'cucumber'
require 'liquid'

require 'lookout/rack/test'
require 'lookout/rack/test/cucumber/transforms'
require 'lookout/rack/test/cucumber/general_steps'
require 'lookout/rack/test/cucumber/before'

require 'lookout/rack/test/cucumber/server'

module Lookout::Rack::Test
  module Cucumber
    include Lookout::Rack::Test::Cucumber::Server

    def render_string(buffer, opts={})
      ::Liquid::Template.parse(buffer).render(template_vars.merge(opts))
    end

    def template_vars
      @template_vars ||= {}
    end

    def current_locale
      I18n.locale = ENV['CUCUMBER_LOCALE'] || 'en'
    end
  end
end

World(Rack::Test::Methods)
World(Lookout::Rack::Test::Cucumber)