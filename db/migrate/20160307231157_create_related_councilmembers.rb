class CreateRelatedCouncilmembers < ActiveRecord::Migration
  def change
    create_table :related_councilmembers do |t|
      t.string :name
      t.string :relationship
      t.timestamps null: false
    end
  end
end
