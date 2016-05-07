class ChangeAllDateTimeToString < ActiveRecord::Migration
  def change
  	change_column :former_criminals,:date_of_conviction,:string
  	change_column :student_applications,:deadline,:string
  	change_column :user_formerworkers,:date_of_employment,:string
	change_column :criminal_applications,:deadline,:string
  end
end
