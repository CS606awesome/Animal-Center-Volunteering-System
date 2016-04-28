class ChangeDataTypeForDob < ActiveRecord::Migration
  def change
    change_column :accounts, :DOB, :string
  end
end
