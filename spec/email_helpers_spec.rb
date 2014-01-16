require 'spec_helper'

require 'lookout/rack/test/rspec/email_helpers'
include Lookout::Rack::Test::RSpec::Emails

describe 'expect_emails' do
  let(:expected_email_name) { 'foo' }
  let(:unexpected_email_name) { 'bar' }

  it 'If I create a Mercury::Message with the expected email_name, it should pass' do
    expect do
      expect_emails([expected_email_name]) do
        Mercury::Messages::SendImmediateBatchEmail.new(:email_name => expected_email_name)
      end
    end.not_to raise_error
  end

  it 'If I create a Mercury::Message with the expected email_name, plus some other email(s), it should fail' do
    expect do
      expect_emails([expected_email_name]) do
        Mercury::Messages::SendImmediateBatchEmail.new(:email_name => expected_email_name)
        Mercury::Messages::SendImmediateBatchEmail.new(:email_name => unexpected_email_name)
      end
    end.to raise_error(ExpectationNotMetError)
  end

  it 'If I create a Mercury::Message with an unexpected email_name, it should fail' do
    expect do
      expect_emails([expected_email_name]) do
        Mercury::Messages::SendImmediateBatchEmail.new(:email_name => unexpected_email_name)
      end
    end.to raise_error(ExpectationNotMetError)
  end

  it 'If I do not create any Mercury::Message, it should fail' do
    expect do
      expect_emails([expected_email_name]) do
      end
    end.to raise_error(ExpectationNotMetError)
  end
end

class Array
  # Create a hash with a key for each element in the array
  def to_hash
    hash = {}
    self.each {|elt| hash[elt] = nil}

    return hash
  end
end

def expect_email_attributes_helper(expected_attrs, actual_attrs)
  expect_email_attributes(expected_attrs) do
    Mercury::Messages::SendImmediateBatchEmail.new(:email_name => '',
                                                   :pieces => [{:attributes => actual_attrs.to_hash}])
  end
end

describe 'expect_email_attributes' do
  let(:expected_email_attributes) { ['foo', 'bar'] }
  let(:unexpected_email_attributes) { ['baz', 'quux'] }

  context 'if I create a Mercury::Message with all of - and only - the expected attributes' do
    let(:actual_attrs) { expected_email_attributes.to_hash }

    it 'should pass' do
      expect { expect_email_attributes_helper(expected_email_attributes, actual_attrs) }.not_to raise_error
    end
  end

  context 'if I create a Mercury::Message without all of the expected attributes' do
    let(:actual_attrs) { [expected_email_attributes.first].to_hash }

    it 'should fail' do
      expect { expect_email_attributes_helper(expected_email_attributes, actual_attrs) }.to raise_error(ExpectationNotMetError)
    end
  end

  context 'if I create a Mercury::Message with all of the expected attributes, plus some others' do
    let(:actual_attrs) { [expected_email_attributes + unexpected_email_attributes].to_hash }

    it 'should fail' do
      expect { expect_email_attributes_helper(expected_email_attributes, actual_attrs) }.to raise_error(ExpectationNotMetError)
    end
  end

  context 'if I create a Mercury::Message with unexpected attributes' do
    let(:actual_attrs) { unexpected_email_attributes.to_hash }

    it 'should fail' do
      expect { expect_email_attributes_helper(expected_email_attributes, actual_attrs) }.to raise_error(ExpectationNotMetError)
    end
  end

  context 'if I do not create a Mercury::Message' do
    it 'it should fail' do
      expect do
        expect_email_attributes(expected_email_attributes) do
        end
      end.to raise_error(ExpectationNotMetError)
    end
  end
end
