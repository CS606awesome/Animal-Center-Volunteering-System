class ChangeConvictionName < ActiveRecord::Migration
  def change
    rename_column :accounts, :has_convicitons, :has_convictions
  end
end
