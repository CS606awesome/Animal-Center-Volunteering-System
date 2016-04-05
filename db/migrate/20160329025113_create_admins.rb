class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :password_digest
      t.string :email
      t.string :key
      t.timestamps null: false
    end
  end
end
