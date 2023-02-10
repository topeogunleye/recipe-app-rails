class Food < ApplicationRecord
  has_many :inventory_foods, foreign_key: :inventory_id
  has_many :recipe_foods, foreign_key: :recipe_id
  has_many :recipes, through: :recipe_foods
  has_many :inventories, through: :inventory_foods
  belongs_to :user, foreign_key: :user_id
  belongs_to :user, foreign_key: :user_id
  validates :name, presence: true
  validates :price, comparison: { greater_than: 0 }, numericality: true
end
