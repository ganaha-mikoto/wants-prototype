class History < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :request
  has_one :shipping_address
  validates :request_id, presence: true
end
