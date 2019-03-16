class Hour < ApplicationRecord
  belongs_to :store
  validates :store, :day, :open, :close, presence: true
  validates :open, :close, format: {
    with: /\d{2}(:\d{2})? [ap]m/,
    message: "time must be entered like 10 am"
  }
end
