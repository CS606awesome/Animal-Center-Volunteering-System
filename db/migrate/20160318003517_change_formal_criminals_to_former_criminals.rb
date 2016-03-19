class ChangeFormalCriminalsToFormerCriminals < ActiveRecord::Migration
  def change
    rename_table :formal_criminals, :former_criminals
  end
end
