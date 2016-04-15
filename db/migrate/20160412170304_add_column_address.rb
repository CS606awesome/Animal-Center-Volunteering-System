class AddColumnAddress < ActiveRecord::Migration
  def change
    remove_column :accounts, :current_address
    add_column :accounts, :country, :string
    add_column :accounts, :state, :string
    add_column :accounts, :city, :string
    add_column :accounts, :street, :string
    add_column :accounts, :zip, :string
  end

end
