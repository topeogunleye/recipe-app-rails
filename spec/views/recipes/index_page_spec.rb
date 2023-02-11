require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Jerry', email: 'jerry@gmail.com', password: 'asdasd')
    @user1.save
    @user2 = User.new(name: 'Kero', email: 'kero@gmail.com', password: 'asdasd')
    @user2.save!
    @recipe1 = Recipe.new(name: 'Sushi', user_id: @user1.id)
    @recipe1.save!
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    visit recipes_path
  end

  it 'should be able to see Recipes' do
    expect(page).to have_content('New Recipe')
  end

  it 'should be able to redirect to add recipe route' do
    click_link 'New Recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'should be able to see save recipe and click on the recently recipe and enter to recipe details' do
    click_link 'New Recipe'
    fill_in 'Name', with: 'Mac and Cheese'
    fill_in 'Description',
            with: 'Very yummy mac & cheese'
    fill_in 'Preparation time', with: '20'
    fill_in 'Cooking time', with: '40'
    click_button 'Create'
    expect(page).to have_content('Mac and Cheese')
  end

  it "shouldn't be able to remove if you are not the owner of the recipe" do
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: @user2.email
    fill_in 'Password', with: @user2.password
    click_button 'Log In'
    visit recipes_path
    expect(page).to_not have_content('Remove')
  end
end
