class RenameColumnAinTableAccountstoB < ActiveRecord::Migration
  def change
    rename_column :accounts, :need_accomendations, :need_accommodations
  end
end
