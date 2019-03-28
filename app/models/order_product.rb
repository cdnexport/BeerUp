class OrderProduct < ApplicationRecord
  belongs_to :Order
  belongs_to :Product

  validates :order, :price, :quantity, :product, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.1 }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
