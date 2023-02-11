class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: 'recipe_id'
  belongs_to :food, foreign_key: 'food_id'
  validates :quantity, numericality: { only_integer: true }, comparison: { greater_than: 0 }
end
