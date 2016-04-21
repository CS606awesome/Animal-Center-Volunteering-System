class AdIsStudentToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_student, :boolean, :default => false
  end
end
