class AddAttachmentMediaToCarrot < ActiveRecord::Migration
  def self.up
    add_column :carrots, :media_file_name, :string
    add_column :carrots, :media_content_type, :string
    add_column :carrots, :media_file_size, :integer
    add_column :carrots, :media_updated_at, :datetime
  end

  def self.down
    remove_column :carrots, :media_file_name
    remove_column :carrots, :media_content_type
    remove_column :carrots, :media_file_size
    remove_column :carrots, :media_updated_at
  end
end
