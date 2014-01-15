unless $factories_loaded
  require 'factory_girl'
  ::FactoryGirl.find_definitions
  $factories_loaded = true
end
