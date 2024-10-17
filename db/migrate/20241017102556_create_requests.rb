class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :max_price, null: false
      t.integer :min_price, null: false
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.integer :shipping_charge_id, null: false

      t.timestamps
    end
  end
end
