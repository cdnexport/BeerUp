class Category < ApplicationRecord
  has_one :parent_category, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :category, class_name: 'Category'

  validates :name, presence: true
end
