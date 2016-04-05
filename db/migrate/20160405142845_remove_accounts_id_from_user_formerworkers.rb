class RemoveAccountsIdFromUserFormerworkers < ActiveRecord::Migration
  def change
    remove_column :user_formerworkers, :accounts_id, :integer
  end
end
