class Recipe < ApplicationRecord
  validates :name, :preparation_time, :cooking_time, :description, :public, presence: true
  belongs_to :user, foreign_key: 'user_id'
  has_many :food, through: :recipe_foods
  has_many :recipe_foods, dependent: :destroy
end
