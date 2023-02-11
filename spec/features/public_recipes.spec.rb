require 'rails_helper'

RSpec.describe 'Public Recipes', type: :feature do
  it 'shows Public Recipes text' do
    visit root_path
    expect(page).to have_content('Public Recipes')
  end
end
