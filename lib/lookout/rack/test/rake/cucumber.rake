require 'cucumber/rake/task'
require 'ci/reporter/rake/cucumber'

# parallel_tests is somewhat pointless/nonfunctional on JRuby
unless RUBY_VERSION == 'java'
  require 'parallel_tests/tasks'
end

namespace :cucumber do
  Cucumber::Rake::Task.new(:api) do |t|
    t.cucumber_opts = '--profile api'
  end
end

Cucumber::Rake::Task.new(:cucumber) do |t|
end
