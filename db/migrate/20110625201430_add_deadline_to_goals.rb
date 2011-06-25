class AddDeadlineToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :deadline, :string
  end

  def self.down
    remove_column :goals, :deadline
  end
end
