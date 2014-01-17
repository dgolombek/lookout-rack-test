require 'timecop'

Before('@timefreeze') do
  Timecop.freeze
end
