class AddColumnSubmitBCheckToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :submit_bcheck, :boolean, :default => false
  end
end
