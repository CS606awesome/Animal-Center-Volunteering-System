class AddAccountToUserFormerworker < ActiveRecord::Migration
  def change
    add_reference :user_formerworkers, :account, index: true, foreign_key: true
  end
end
