class AddMessageToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :message, :string
  end

  def self.down
    remove_column :goals, :message
  end
end
