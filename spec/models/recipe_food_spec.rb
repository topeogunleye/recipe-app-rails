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

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
  end
end
