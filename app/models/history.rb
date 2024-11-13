class History < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :request_id, presence: true
end
