source 'https://rubygems.org'

# Specify your gem's dependencies in lookout-rack-test.gemspec
gemspec

# For local tests, pin dependencies for pre Ruby 2.X
if RUBY_VERSION.start_with?("1")
  gem "activesupport", "< 5"
  gem "liquid", "< 4"
elsif RUBY_VERSION =~ (/^2.[01]/)
  gem "activesupport", "< 5"
end
