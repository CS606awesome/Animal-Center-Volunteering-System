class ChangeUserformalworkersToUserformerworkers < ActiveRecord::Migration
  def change
  	rename_table :user_formalworkers, :user_formerworkers
  end
end
