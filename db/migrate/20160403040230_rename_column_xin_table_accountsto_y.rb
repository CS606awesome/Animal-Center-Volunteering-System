class RenameColumnXinTableAccountstoY < ActiveRecord::Migration
  def change
    rename_column :accounts, :is_formal_worker, :is_former_worker
    #rename_column :criminal_applications, :deadlin, :deadline
  end
end
