class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :dob
      t.string :sex
      t.string :blood_type
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
