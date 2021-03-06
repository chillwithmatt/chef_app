class Dish < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	
	validates :name, presence: true
	validates :description, presence: true

	has_many :assets, dependent: :destroy
	accepts_nested_attributes_for :assets, allow_destroy: true

	validates_presence_of :assets

	def dish_photo
		asset = assets.first
		asset.photo
	end

end
