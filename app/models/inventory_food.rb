class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food
  validates :quantity, numericality: { only_integer: true }, comparison: { greater_than: 0 }
end
