class RemoveIsCurrentWorkerFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :is_current_worker
  end
end
