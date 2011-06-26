module ApplicationHelper
  
  def is_goal_finished(carrot)
  	  puts "in goal"
    @carrot = Carrot.find(carrot) 
    return @carrot.goal.finished	  
  end
  
end
