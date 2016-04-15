class AddFormerCrimesToFormerCriminals < ActiveRecord::Migration
  def change
  	add_column :former_criminals, :former_crime, :string
  end
end
