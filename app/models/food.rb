class Food < ApplicationRecord
  has_many :inventory_foods, foreign_key: :inventory_id
  has_many :recipe_foods, foreign_key: :recipe_id
  belongs_to :user, foreign_key: :user_id
  has_many :inventories, through: :inventory_foods
  validates :name, presence: true
  validates :price, comparison: { greater_than: 0 }, numericality: true
end
