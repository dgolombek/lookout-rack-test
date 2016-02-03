# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lookout/rack/test/version'

Gem::Specification.new do |spec|
  spec.name = "lookout-rack-test"
  spec.version = Lookout::Rack::Test::VERSION
  spec.authors = ["Ian Smith"]
  spec.email = ["ian.smith@lookout.com"]
  spec.description = %q{RSpec and Cucumber helpers}
  spec.summary = %q{}
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "sinatra"

  # Required for {{token}} substitutions in Cucumber API scenarios
  spec.add_dependency 'liquid'
  spec.add_dependency 'rspec'
  spec.add_dependency 'ci_reporter'
  spec.add_dependency 'ci_reporter_cucumber'
  spec.add_dependency 'ci_reporter_rspec'
  spec.add_dependency 'rack-test'
  # For freezing time inside of tests
  spec.add_dependency 'timecop'
  # Used to assist with scaffolded data and generating random data
  spec.add_dependency 'factory_girl'
  spec.add_dependency 'cucumber'
  spec.add_dependency 'parallel_tests'
end