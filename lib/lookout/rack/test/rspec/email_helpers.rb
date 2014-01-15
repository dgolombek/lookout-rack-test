require 'rspec'
require 'set'
require 'mercury-messages'

module Lookout::Rack::Test::RSpec
  module Emails
    def expect_emails(expected_email_names)
      email_names = []
      Mercury::Messages::SendImmediateBatchEmail.stub(:new) do |mail_hash|
        email_names << mail_hash[:email_name]
      end

      yield 

      expect(Set.new(email_names)).to eql Set.new(expected_email_names)
    end
    
    def expect_email_attributes(expected_attributes)
      attributes = []
      Mercury::Messages::SendImmediateBatchEmail.stub(:new) do |mail_hash|
        # Get all the keys (attributes) for each of this Message's pieces
        attributes += mail_hash[:pieces].map{|h| h[:attributes]}.map(&:keys)
      end

      yield

      attributes.flatten!

      expect(Set.new(attributes)).to eql Set.new(expected_attributes)
    end
  end
end
