class DropEmergencyContactsTable < ActiveRecord::Migration
  def self.up
    drop_table :emergency_contacts
  end

  def self.down
    create_table "emergency_contacts", :force => true do |t|
      t.integer  "user_id"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "phone"
      t.string   "email"
      t.string   "address"
      t.string   "relationship"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
