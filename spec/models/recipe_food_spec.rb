require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, :user) }
  let(:food) { create(:food) }
  let(:recipe_foods) { create(:recipe_foods, recipe:, food:) }

  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:food) }
  end
end
