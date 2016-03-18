class ChangeColumnNames < ActiveRecord::Migration
  def change
  	 rename_column :accounts, :is_formal_worker, :is_former_worker
  end
end
