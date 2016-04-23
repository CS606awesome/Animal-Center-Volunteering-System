class AddRelatedToCouncilMembersToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :related_to_councilmember, :boolean, :default => false
  end
end
