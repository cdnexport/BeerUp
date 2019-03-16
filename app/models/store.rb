class Store < ApplicationRecord
  validates :name, :address, :city, :postal_code, :phone, :latitude, :longitude, presence: true
  validates :phone, format: {
    with: /\(\d{3}\) \d{3}-\d{4}/,
    message: "phone number must match pattern (xxx) xxx-xxxx"
  }

  validates :postal_code, format: {
    with: /[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} \d{1}[A-Z]{1}\d{1}/,
    message: "postal code must match pattern H0H 0H0"
  }
end
