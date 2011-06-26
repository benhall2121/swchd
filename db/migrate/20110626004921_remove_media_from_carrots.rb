class RemoveMediaFromCarrots < ActiveRecord::Migration
  def self.up
    remove_column :carrots, :media
  end

  def self.down
    add_column :carrots, :media, :string
  end
end
