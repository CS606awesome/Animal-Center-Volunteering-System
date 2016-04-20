class AddIsFormerWorkerFromAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_former_worker, :boolean, :default => false
  end
end
