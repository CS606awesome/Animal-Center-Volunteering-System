class AddShirtSizeToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :shirt_size, :string
  end
end
