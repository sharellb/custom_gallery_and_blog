class Photo < ActiveRecord::Base
	mount_uploader :link, AvatarUploader
end
