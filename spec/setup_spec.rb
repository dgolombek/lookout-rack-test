require 'spec_helper'

describe ':timefreeze => true' do
  before :each do
    @initial_time = Time.now
    sleep 0.5
  end

  context 'a test marked as :timefreeze => true', :timefreeze => true do
    it 'should be frozen in time' do
      expect(@initial_time).to eql Time.now
    end
  end

  context 'a test not marked as :timefreeze => true' do
    it 'should not be frozen in time' do
      expect(@initial_time).not_to eql Time.now
    end
  end
end

describe ':speed => :slow' do
  context 'a test marked as :speed => :slow', :speed => :slow do
    it 'should have called .setup on the Models module' do
      expect(TestModels.was_setup?).to be true
    end

    it 'loads factories' do
      expect(FactoryBot.build(:fake_request)).not_to be_nil
    end
  end

  context 'a test not marked as :speed => :slow' do
    before do
      # Unload factories in case they were loaded in 'loads factories' spec above.
      FactoryBot.reset_configuration
      FactoryBot.register_default_strategies
    end

    it 'should not have called .setup on the Models module' do
      expect(TestModels.was_setup?).to be false
    end

    it 'does not load factories' do
      expect { FactoryBot.build(:fake_request) }.to raise_error(/Factory not registered/)
    end
  end
end

describe ':type => :route' do
  subject(:request) { get '/' }

  context 'a test marked as :type => :route', :type => :route do
    it 'should be able to GET a route' do
      expect { get '/' }.not_to raise_error
      expect(last_response.status).to be 200
    end
  end

  context 'a test not marked as :type => :route' do
    it 'should not be able to GET a route' do
      expect { get '/' }.to raise_error(NoMethodError)
    end
  end
end
