class AddAccountToRelatedCouncilmember < ActiveRecord::Migration
  def change
    add_reference :related_councilmembers, :account, index: true, foreign_key: true
  end
end
