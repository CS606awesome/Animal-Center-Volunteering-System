class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.string :interested_area
      t.string :volunteering_status
      t.column(:signature, :binary, limit: 2.megabytes)
      t.datetime :application_date
      t.datetime :available_time_begin
      t.datetime :available_time_end

      t.timestamps null: false
    end
  end
end
