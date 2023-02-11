require 'rails_helper'

RSpec.describe InventoryFood, type: :model do

  @user = User.create(name: "test user", email:"test@gmail.com", password:"123321")
  @inventory = Inventory.create(name: "inventory 1", description: "This is the first inventory test", user_id: 1)
  @food = Food.create(name: "apple")

  subject { InventoryFood.new(quantity: 10, inventory: @inventory, food: @food) }

  before { subject.save }

  it "quantity should be valid" do
    expect(subject).to be_valid
  end

  it "description should Not be valid" do
    subject.quantity = -10
    expect(subject).to_not be_valid
  end
end

