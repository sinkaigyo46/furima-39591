class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :postal_code,      null:  false
      t.integer :prefecture_id,    null:  false
      t.string  :city_town,        null:  false
      t.string  :street_number,    null:  false
      t.string  :building_name 
      t.string  :phone_number,     null:  false
      t.references  :shipping,     null:  false, foreign_key: true
      t.timestamps
    end
  end
end
