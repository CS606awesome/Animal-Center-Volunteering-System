class AddMaidennameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :maidenname, :string
  end
end
