class RemoveRelatedToCouncilmemberFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :related_to_councilmember
  end
end
