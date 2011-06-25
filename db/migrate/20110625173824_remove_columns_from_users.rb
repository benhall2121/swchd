class RemoveColumnsFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :dob
    remove_column :users, :sex
    remove_column :users, :blood_type
    remove_column :users, :notes
    remove_column :users, :image_file_name
    remove_column :users, :image_content_type
    remove_column :users, :image_file_size
    remove_column :users, :image_updated_at
  end

  def self.down
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :dob, :string
    add_column :users, :sex, :string
    add_column :users, :blood_type, :string
    add_column :users, :notes, :string
    add_column :users, :image_file_name, :string
    add_column :users, :image_content_type, :string
    add_column :users, :image_file_size, :integer
    add_column :users, :image_updated_at, :datetime
  end
end
