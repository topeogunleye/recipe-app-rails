class Food < ApplicationRecord
  has_many :inventory_foods, foreign_key: :inventory_id
  has_many :recipe_foods, foreign_key: :recipe_id
  validates :name, presence: true
  validates :price, comparison: { greater_than: 0 }, numericality: true
end
