class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :request_id, :product_id, :postal_code, :prefecture_id, 
                :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :request_id
    validates :product_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(
      user_id: user_id,
      request_id: request_id,
      product_id: product_id
    )
    
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end 