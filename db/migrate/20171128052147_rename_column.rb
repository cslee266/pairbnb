class RenameColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :verification, :superadmin
  	add_column :users, :moderator, :boolean
  	add_column :users, :customer, :boolean
  end
end
