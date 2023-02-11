require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Jerry', email: 'jerry@email.com', password: 'asdasd')
    @user.save
    @recipe = Recipe.new(name: 'Sushi', user_id: @user.id, preparation_time: 20, cooking_time: 40, description: 'Very yummy sushi', public: true)
    @recipe.save
  end

  it 'should be valid' do
    expect(@recipe).to be_valid
  end

  it 'should be invalid without name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'should be invalid without user_id' do
    @recipe.user_id = nil
    expect(@recipe).to_not be_valid
  end
end
