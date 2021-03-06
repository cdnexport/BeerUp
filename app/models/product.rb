class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :description, :alcohol, :country, :size, :manufacturer, :image, :category, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.1 }
  validates :alcohol, numericality: { greater_than_or_equal_to: 0 }
end
