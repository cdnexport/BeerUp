class Order < ApplicationRecord
  belongs_to :Tax
  belongs_to :OrderStatus

  validates :orderdate, :tax, :subtotal, :taxamount, :total, :orderstatus, presence: true
  validates :taxamount, numericality: { greater_than_or_equal_to: 0 }
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :subtotal, numericality: { greater_than_or_equal_to: 0 }
end
