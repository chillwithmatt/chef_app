class Dish < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	
	has_many :assets
	accepts_nested_attributes_for :assets

end
