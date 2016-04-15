class AddAccountToCriminalApplication < ActiveRecord::Migration
  def change
    add_reference :criminal_applications, :account, index: true, foreign_key: true
  end
end
