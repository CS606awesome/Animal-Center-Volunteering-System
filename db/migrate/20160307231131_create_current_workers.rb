class CreateCurrentWorkers < ActiveRecord::Migration
  def change
    create_table :current_workers do |t|
      t.string name
      t.string department
      t.timestamps null: false
    end
  end
end
