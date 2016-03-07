class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string accommodation_name
      t.timestamps null: false
    end
  end
end
