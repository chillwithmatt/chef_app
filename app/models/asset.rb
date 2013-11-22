class Asset < ActiveRecord::Base
	belongs_to :dish

	has_attached_file :photo, 
		:styles => {
			:thumb => '150x150#',
			:medium => '300x300>',
			:large => '600x600>'
		}

end
