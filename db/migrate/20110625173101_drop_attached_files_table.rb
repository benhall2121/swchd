class DropAttachedFilesTable < ActiveRecord::Migration
  def self.up
    drop_table :attached_files
  end

  def self.down
    create_table "attached_files", :force => true do |t|
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "file_file_name"
      t.string   "file_content_type"
      t.string   "file_file_size"
      t.datetime "file_updated_at"
    end
  end
end
