module ApplicationHelper
  
  def is_goal_finished(carrot)
  	  puts "in goal"
    @carrot = Carrot.find(carrot) 
    return @carrot.goal.finished	  
  end
  
  def already_friends(friend_id)
  	  if Friendship.find_by_user_id_and_friend_id(current_user.id, friend_id)
  	  	  return true
  	  else
  	  	  return false
  	  end
  end
  
end
