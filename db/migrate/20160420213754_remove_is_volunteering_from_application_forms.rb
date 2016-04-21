class RemoveIsVolunteeringFromApplicationForms < ActiveRecord::Migration
  def change
    remove_column :application_forms, :volunteering_status, :string
  end
end
