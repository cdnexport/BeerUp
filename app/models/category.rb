class Category < ApplicationRecord
  has_many :subcategory, class_name: "Category",
                          foreign_key: "parent_id"

  belongs_to :parent, class_name: "Category", optional: true

  validates :name, presence: true
end