class CreateEmergencyContacts < ActiveRecord::Migration
  def self.up
    create_table :emergency_contacts do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :relationship

      t.timestamps
    end
  end

  def self.down
    drop_table :emergency_contacts
  end
end
