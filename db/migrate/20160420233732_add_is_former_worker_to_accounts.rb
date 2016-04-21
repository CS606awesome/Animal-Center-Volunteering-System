class AddIsFormerWorkerToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_current_worker, :boolean, :default => false
  end
end
