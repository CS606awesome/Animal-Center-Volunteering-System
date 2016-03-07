class CreateStudentApplications < ActiveRecord::Migration
  def change
    create_table :student_applications do |t|
      t.string :student_program
      t.integer :required_time
      t.string :required_area
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
