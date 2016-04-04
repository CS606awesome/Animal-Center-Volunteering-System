class AddAccountToCurrentWorker < ActiveRecord::Migration
  def change
    add_reference :current_workers, :account, index: true, foreign_key: true
  end
end
