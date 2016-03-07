class CreateMinorApplications < ActiveRecord::Migration
  def change
    create_table :minor_applications do |t|
      t.metadata :parent_signature

      t.timestamps null: false
    end
  end
end
