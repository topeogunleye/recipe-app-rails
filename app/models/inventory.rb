class Inventory < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, length: { maximum: 250 }
end
