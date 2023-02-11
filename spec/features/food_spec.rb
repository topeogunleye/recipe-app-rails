require 'rails_helper'

RSpec.describe Food, type: :feature do
  before :each do
    @user = User.create(name: 'user1',
                        email: 'user@gmail.com',
                        password: '123456')

    @food1 = Food.create(name: 'Apple',
                         measurement_unit: 'gram',
                         price: '1')

    @food2 = Food.create(name: 'Tomato',
                         measurement_unit: 'gram',
                         price: '1.5')

    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit foods_path
    sleep(5)
  end

  describe 'food index page' do
    it 'shows the columns of a table' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement Unit')
      expect(page).to have_content('Price')
      expect(page).to have_content('Actions')
      expect(page).to have_content('Add Food')
    end

    it 'redirects to the food add form' do
      click_link 'Add Food'
      expect(page).to have_content('New food')
      expect(page).to have_content('Back to foods')
    end
  end
end
