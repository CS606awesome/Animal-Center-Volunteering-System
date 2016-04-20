class RemoveHasConvictionsFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :has_convictions
  end
end
