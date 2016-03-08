class CreateUserFormalworkers < ActiveRecord::Migration
  def change
    create_table :user_formalworkers do |t|
      t.datetime :date_of_employment
      t.string :reason_for_leaving
      t.string :position_or_department
      t.string :interested_area
<<<<<<< HEAD
=======

>>>>>>> master
      t.timestamps null: false
    end
  end
end
