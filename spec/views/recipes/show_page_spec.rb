require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
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


    it 'should be able to see Recipe Food' do
      expect(page).to have_content('Sushi')
    end

    it 'should be able to add new ingredients' do
      click_link 'Add Ingredient'
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe1.id))
    end

    it 'should be able to delete ingredients' do
      click_link 'Delete'
      expect(page).to have_current_path(recipe_path(@recipe1.id))
    end

    it 'should be able to edit ingredients' do
      click_link 'Edit'
      expect(page).to have_current_path(edit_recipe_recipe_food_path(@recipe1.id, @recipe_food1.id))
    end

  end