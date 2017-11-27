class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :property_type
      t.string :room_number
      t.string :bed_number
      t.string :guest_number
      t.string :country
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :address
      t.string :price
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
