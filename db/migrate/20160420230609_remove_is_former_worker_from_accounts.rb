class RemoveIsFormerWorkerFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :is_former_worker, :boolean, :default => false
  end
end
