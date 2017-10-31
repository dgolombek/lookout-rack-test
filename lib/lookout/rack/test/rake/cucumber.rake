require 'cucumber/rake/task'
require 'ci/reporter/rake/cucumber'

namespace :cucumber do
  Cucumber::Rake::Task.new(:api) do |t|
    t.cucumber_opts = '--profile api'
  end
end

Cucumber::Rake::Task.new(:cucumber) do |t|
end
