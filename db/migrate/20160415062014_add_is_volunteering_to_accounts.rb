class AddIsVolunteeringToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :is_volunteering, :boolean, :default => false
  end
end
