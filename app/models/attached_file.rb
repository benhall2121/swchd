class AttachedFile < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :file, :styles => { :small => "150x150>" },
	:url  => "/assets/files/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/files/:id/:style/:basename.:extension"

end
