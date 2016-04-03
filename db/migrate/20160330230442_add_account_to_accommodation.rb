class AddAccountToAccommodation < ActiveRecord::Migration
  def change
    add_reference :accommodations, :account, index: true, foreign_key: true
  end
end
