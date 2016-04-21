class RemoveNeedAccommodationsFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :need_accommodations
  end
end
