require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user1 = User.new(name: 'Jerry', email: 'jerry@rmail.com', password: 'asdasd')
    @user1.save
    @user2 = User.new(name: 'Kero', email: 'kero@email.com', password: 'asdasd')
    @user2.save!
    @recipe1 = Recipe.new(name: 'Sushi', user_id: @user1.id)
    @recipe1.save!
    @recipe_food1 = RecipeFood.new(recipe_id: @recipe1.id, food_id: 1, quantity: 1)
    @recipe_food1.save!
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    visit recipe_path(@recipe1.id)
  end

  it 'should be valid' do
    expect(@recipe_food1).to be_valid
  end

  it 'should be invalid without recipe_id' do
    @recipe_food1.recipe_id = nil
    expect(@recipe_food1).to_not be_valid
  end

  it 'should be invalid without food_id' do
    @recipe_food1.food_id = nil
    expect(@recipe_food1).to_not be_valid
  end
end