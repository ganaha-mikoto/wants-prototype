class PurchaseForm
  include ActiveModel::Model

  # 必要な属性をすべて定義
  attr_accessor :postal_code, :prefecture_id, :city, :addresses,
                :building, :phone_number, :token, :user_id, :product_id,
                :request_id

  # バリデーション
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :request_id, presence: true

  def save
    ActiveRecord::Base.transaction do
      history = History.create!(
        user_id: user_id,
        product_id: product_id,
        request_id: request_id
      )
      
      ShippingAddress.create!(
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        addresses: addresses,
        building: building,
        phone_number: phone_number,
        history_id: history.id
      )
    end
  end
end 