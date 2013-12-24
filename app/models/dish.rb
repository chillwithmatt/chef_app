class Dish < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	
	validates :name, presence: true
	validates :description, presence: true

	has_many :assets, dependent: :destroy
	accepts_nested_attributes_for :assets, allow_destroy: true

	validates_presence_of :assets

	def self.photo
		self.assets.first.photo.url
	end

	def self.search(search)
  		if search
    		find(:all, :joins => :user, 
    			 :conditions => ['lower(dishes.name) LIKE :search OR 
    			 	lower(users.name) LIKE :search OR 
    			 	lower(users.city) LIKE :search OR 
    			 	lower(users.style) LIKE :search', {:search => "%#{search.downcase}%"}])
  		else
    		find(:all)
  		end
	end

	def dish_photo
		asset = assets.first
		asset.photo
	end

end
