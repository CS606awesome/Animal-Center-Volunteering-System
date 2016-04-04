class AddAccountToFormerCriminal < ActiveRecord::Migration
  def change
    add_reference :former_criminals, :account, index: true, foreign_key: true
  end
end
