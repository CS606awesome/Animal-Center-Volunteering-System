class AddAccountToMinorApplication < ActiveRecord::Migration
  def change
    add_reference :minor_applications, :account, index: true, foreign_key: true
  end
end
