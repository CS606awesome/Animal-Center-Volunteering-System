class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :application_forms, :interested_area, :interested_areas
  end
end
