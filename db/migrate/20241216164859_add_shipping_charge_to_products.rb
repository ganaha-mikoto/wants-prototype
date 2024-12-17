class AddShippingChargeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :shipping_charge_id, :integer
  end
end
