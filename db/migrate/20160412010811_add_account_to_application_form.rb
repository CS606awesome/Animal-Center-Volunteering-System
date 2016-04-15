class AddAccountToApplicationForm < ActiveRecord::Migration
  def change
    add_reference :application_forms, :account, index: true, foreign_key: true
  end
end
