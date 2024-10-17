class Request < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :comments
  has_one_attached :image
  has_many :histories

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge

  validates :title, :description, :category_id, :shipping_charge_id, presence: true
  validates :category_id, :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :max_price, :min_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between 300 and 9999999" }
end
