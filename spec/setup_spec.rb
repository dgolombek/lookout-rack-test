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
  end

  context 'a test not marked as :speed => :slow' do
    it 'should not have called .setup on the Models module' do
      expect(TestModels.was_setup?).to be false
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
