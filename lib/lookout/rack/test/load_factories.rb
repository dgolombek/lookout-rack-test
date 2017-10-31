unless $factories_loaded
  require 'factory_bot'
  ::FactoryBot.find_definitions
  $factories_loaded = true
end
