class CreateCriminalApplications < ActiveRecord::Migration
  def change
    create_table :criminal_applications do |t|
      t.integer :mandatory_hours
      t.string :mandatory_area
      t.datetime :deadlin

      t.timestamps null: false
    end
  end
end
