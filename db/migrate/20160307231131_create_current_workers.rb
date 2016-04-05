class CreateCurrentWorkers < ActiveRecord::Migration
  def change
    create_table :current_workers do |t|
      #t.belongs_to :account
      t.string :name
      t.string :department
      t.timestamps null: false
      t.references :account, foreign_key: true
    end
  end
end
