require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

RSpec::Core::RakeTask.new(:spec) do |r|
  r.rspec_opts = '--color --order random'
end


namespace :spec do
  RSpec::Core::RakeTask.new(:slow) do |r|
    r.rspec_opts = '-t speed:slow'
  end

  RSpec::Core::RakeTask.new(:fast) do |r|
    r.rspec_opts = '-t ~speed:slow'
  end

  RSpec::Core::RakeTask.new(:routes) do |r|
    r.rspec_opts = '-t type:route'
  end
end

