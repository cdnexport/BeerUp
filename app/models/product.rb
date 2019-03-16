class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :description, :alcohol, :container, :country, :size, :manufacturer, :image, :category, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :alcohol, numericality: { greater_than_or_equal_to: 0 }
end
