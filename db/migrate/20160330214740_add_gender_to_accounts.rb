class AddGenderToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :gender, :string
  end
end
