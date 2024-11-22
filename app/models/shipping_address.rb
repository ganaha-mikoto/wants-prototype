class ShippingAddress < ApplicationRecord
  belongs_to :history

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
