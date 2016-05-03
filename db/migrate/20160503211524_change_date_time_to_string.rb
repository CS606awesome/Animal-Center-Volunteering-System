class ChangeDateTimeToString < ActiveRecord::Migration
  def change
    change_column :application_forms,:available_time_begin,:string
    change_column :application_forms,:available_time_end,:string
  end
end
