class AddHasConvictionsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :has_convictions, :boolean, :default => false
  end
end
