class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :reservations, :max_guests, :num_guests
  end
end
