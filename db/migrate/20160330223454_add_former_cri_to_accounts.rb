class AddFormerCriToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :former_cri, :string
  end
end
