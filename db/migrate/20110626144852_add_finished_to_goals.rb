class AddFinishedToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :finished, :boolean
  end

  def self.down
    remove_column :goals, :finished
  end
end
