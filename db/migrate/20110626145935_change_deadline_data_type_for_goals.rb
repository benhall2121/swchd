class ChangeDeadlineDataTypeForGoals < ActiveRecord::Migration
  def self.up
    change_table :goals do |t|
      t.change :deadline, :datetime	  
    end
  end

  def self.down
    change_table :goals do |t|
      t.change :deadline, :string	  
    end
  end
end
