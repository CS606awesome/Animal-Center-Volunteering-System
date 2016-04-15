class RenameDeadlinInTableCriminalApplicationsToDeadline < ActiveRecord::Migration
  def change
    rename_column :criminal_applications, :deadlin, :deadline
  end
end
