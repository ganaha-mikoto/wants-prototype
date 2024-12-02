class Product < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :shipping_address
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  belongs_to :shipping_charge

  validates :title, :description, :condition_id, :shipping_area_id, :shipping_day_id, presence: true
  validates :condition_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between 300 and 9999999" }
end
