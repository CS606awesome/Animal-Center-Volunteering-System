class CreateFormalCriminals < ActiveRecord::Migration
  def change
    create_table :formal_criminals do |t|
      t.datetime :date_of_conviction
      t.string :nature_of_offense
      t.string :name_of_court
      t.string :disposition_of_case


      t.timestamps null: false
    end
  end
end
