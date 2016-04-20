class AdNeedAccommodationsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :need_accommodations, :boolean, :default => false
  end
end
