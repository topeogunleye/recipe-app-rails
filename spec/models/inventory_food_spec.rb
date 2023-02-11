require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, :user) }
  let(:food) { create(:food) }
  let(:inventory_foods) { create(:inventory_foods, inventory:, food:) }

  describe 'associations' do
    it { is_expected.to belong_to(:inventory) }
    it { is_expected.to belong_to(:food) }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:quantity) }
  end
end
