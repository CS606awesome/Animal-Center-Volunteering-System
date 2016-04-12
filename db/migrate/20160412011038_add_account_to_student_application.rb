class AddAccountToStudentApplication < ActiveRecord::Migration
  def change
    add_reference :student_applications, :account, index: true, foreign_key: true
  end
end
