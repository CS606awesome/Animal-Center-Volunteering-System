class AddStatusToAccount < ActiveRecord::Migration
  def change
  	add_column :accounts, :status, :boolean
  end
end
