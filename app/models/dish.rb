class Dish < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	
	has_many :assets, dependent: :destroy
	accepts_nested_attributes_for :assets, allow_destroy: true
	
	validates :name, presence: true

end
