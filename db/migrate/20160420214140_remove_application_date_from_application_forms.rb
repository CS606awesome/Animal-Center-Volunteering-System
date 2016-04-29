class RemoveApplicationDateFromApplicationForms < ActiveRecord::Migration
  def change
    remove_column :application_forms, :application_date, :datatime
  end
end
