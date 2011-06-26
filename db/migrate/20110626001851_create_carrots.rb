class CreateCarrots < ActiveRecord::Migration
  def self.up
    create_table :carrots do |t|
      t.integer :goal_id
      t.integer :friend_id
      t.string :title
      t.string :media

      t.timestamps
    end
  end

  def self.down
    drop_table :carrots
  end
end
