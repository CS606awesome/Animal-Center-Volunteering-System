class CreateMinorApplications < ActiveRecord::Migration
  def change
    create_table :minor_applications do |t|
      t.column(:parent_signature, :binary, limit: 2.megabytes)
     

      t.timestamps null: false
    end
  end
end
