class AddVerificationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verification, :boolean
  end
end
