class TaxRate < ApplicationRecord
  validates :pst, :gst, :hst, :active, presence: true
  validates :pst, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :gst, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :hst, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

end
