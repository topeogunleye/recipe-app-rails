require 'rails_helper'

RSpec.describe Inventory, type: :model do
  @user = User.create(name: 'test user', email: 'test@gmail.com', password: '123321')

  subject { Inventory.new(name: 'inventory 1', description: 'This is the first inventory test', user_id: 1) }

  before { subject.save }

  it 'description should be valid' do
    expect(subject).to be_valid
  end

  it 'description should not be valid' do
    subject.description = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec.'
    expect(subject).to_not be_valid
  end
end
