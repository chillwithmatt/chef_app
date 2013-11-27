class Asset < ActiveRecord::Base
	belongs_to :dish

	has_attached_file :photo, 
		:styles => {
			:thumb => '100x100#',
			:medium => '200x200>',
			:large => '600x600>'
		}

end
