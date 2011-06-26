class Carrot < ActiveRecord::Base
  belongs_to :goal
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'
  
  has_attached_file :media, :styles => { :small => "150x150>" },
  :url  => "/assets/media/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/media/:id/:style/:basename.:extension"

end
