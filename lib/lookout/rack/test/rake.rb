module Lookout::Rack::Test
  module Rake
  end
end

# Load the rake tasks
Dir[File.expand_path(File.dirname(__FILE__) + '/rake/*.rake')].each do |f|
  begin
    load f
  rescue LoadError => ex
    puts "Failed to load #{f}"
    puts ex
    puts ex.backtrace
    exit 1
  end
end
