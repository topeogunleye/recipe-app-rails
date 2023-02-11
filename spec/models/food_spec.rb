require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.create(name: 'Apple', measurement_unit: 'grams', price: 2.0)
  end
  before { subject.save }
  context 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'subject.name should return Apple' do
      expect(subject.name).to eq 'Apple'
    end

    it 'subject.measurement_unit should return grams' do
      expect(subject.measurement_unit).to eq 'grams'
    end

    it 'subject.price should return 2.0' do
      expect(subject.price).to eq 2.0
    end
  end
end
