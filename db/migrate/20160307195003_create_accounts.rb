class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string, :email
      t.string :firstname
      t.string :string,
      t.string :lastname
      t.string :string,
      t.string :password_digest
      t.string :string,
      t.string :DOB
      t.string :date,current_address
      t.string :string,
      t.string :homephone
      t.string :string,
      t.string :cellphone
      t.string :string,
      t.string :is_formal_worker
      t.string :boolean,
      t.string :has_conviciton
      t.string :boolean,
      t.string :emergency_contact_name
      t.string :string,
      t.string :emergency_phone
      t.string :string,
      t.string :emergency_phone_alternate
      t.string :string,
      t.string :need_accomendations
      t.string :boolean,
      t.string :related_to_councilmember
      t.string :boolean,
      t.string :is_current_worker
      t.string :boolean,
      t.string :driver_license
      t.string :meta_data,
      t.string :SSN
      t.string :integer,
      t.string :picture
      t.string :meta_data
    end
  end
end
