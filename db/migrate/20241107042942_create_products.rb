class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.string :image
      t.integer :condition_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :shipping_day_id, null: false

      t.timestamps
    end
  end
end
