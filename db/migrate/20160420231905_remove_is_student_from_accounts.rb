class RemoveIsStudentFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :is_student, :boolean
  end
end
