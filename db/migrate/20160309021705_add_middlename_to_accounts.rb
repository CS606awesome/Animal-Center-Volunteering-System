class AddMiddlenameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :middlename, :string
  end
end
