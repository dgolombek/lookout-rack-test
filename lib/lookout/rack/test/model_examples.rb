require 'rspec'

module Lookout::Rack::Test
  module Models
    shared_examples 'a timestamped model' do
      it { should respond_to :id }
      it { should respond_to :created_at }
      it { should respond_to :updated_at }
      it { should respond_to :deleted_at }
    end
  end
end
