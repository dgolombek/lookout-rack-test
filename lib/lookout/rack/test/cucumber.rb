require 'rack/test'
require 'cucumber'
require 'liquid'

require 'lookout/rack/test/cucumber/server' if $application_class
require 'lookout/rack/test/cucumber/general_steps'

module Lookout::Rack::Test
  module Cucumber
    def render_string(buffer, opts={})
      ::Liquid::Template.parse(buffer).render(template_vars.merge(opts))
    end

    def template_vars
      @template_vars ||= {}
    end

    def current_locale
      I18n.locale = ENV['CUCUMBER_LOCALE'] || 'en'
    end

    def app
      @app ||= $application_class.new if $application_class
    end
  end
end

World(Rack::Test::Methods)
World(Lookout::Rack::Test::Cucumber)
