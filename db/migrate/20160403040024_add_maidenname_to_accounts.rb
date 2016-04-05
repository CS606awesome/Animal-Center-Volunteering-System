class AddMaidennameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :maidenname, :string
    add_column :accounts, :gender, :string
  end
end
