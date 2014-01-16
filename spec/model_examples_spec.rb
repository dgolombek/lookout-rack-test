require 'spec_helper'

describe 'A timestamped model' do
  context 'A model' do
    subject(:model) { double('Mock model') }

    before :each do
      attrs.each do |attr|
        model.stub(attr)
      end
    end

    context 'that is a timestamped model' do
      let(:attrs) { [:id, :created_at, :updated_at, :deleted_at] }

      it_behaves_like 'a timestamped model'
    end

    context 'without an id' do
      let(:attrs) { [:created_at, :updated_at, :deleted_at] }

      it 'should not behave like a timestamped model' do
        pending
      end
    end

    context 'without an created_at' do
      let(:attrs) { [:id, :updated_at, :deleted_at] }

      it 'should not behave like a timestamped model' do
        pending
      end
    end

    context 'without an updated_at' do
      let(:attrs) { [:id, :created_at, :deleted_at] }

      it 'should not behave like a timestamped model' do
        pending
      end
    end

    context 'without an deleted_at' do
      let(:attrs) { [:id, :created_at, :updated_at] }

      it 'should not behave like a timestamped model' do
        pending
      end
    end
  end
end
