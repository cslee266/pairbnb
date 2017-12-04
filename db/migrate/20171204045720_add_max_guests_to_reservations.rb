class AddMaxGuestsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :max_guests, :integer
  end
end
