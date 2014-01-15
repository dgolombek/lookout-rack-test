require 'timecop'

Before('@timefreeze') do
  Timecop.freeze
end

Before('@selenium') do
  def full_url_for(options)
    if ENV['BASE_URL']
      base_url = URI.parse(ENV['BASE_URL'])
    else
      base_url = configatron.base_url if defined?(configatron)
    end

    unless current_locale.to_s == 'en'
      "#{base_url}/#{current_locale.to_s}#{options}"
    else
      "#{base_url}#{options}"
    end
  end
end
