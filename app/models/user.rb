class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	default_scope -> { order('users.created_at DESC') }	
	scope :top, joins(:dishes).select('users.id, users.name, users.city, users.style, count(dishes.id) AS dishes_count').group('users.id').order('dishes_count DESC')

	has_many :dishes, dependent: :destroy
	has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

	validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, 
  			  format: { with: VALID_EMAIL_REGEX }, 
  			  uniqueness: { case_sensitive: false }
  	validates :city, presence: true

	has_secure_password

	def self.search(search)
  		if search
    		find(:all, :conditions => ['users.city LIKE :search OR users.style LIKE :search OR users.name LIKE :search', {:search => "%#{search}%"}])
  		else
    		find(:all)
  		end
	end

	def self.from_omniauth(auth)
	   	user = where(auth.slice(:provider, :uid)).first
	   	#resets a user's password after an initial normal signin :(
	   	unless user
			user = where(email: auth.info.email).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.email = auth.info.email
			user.city = auth.info.location
			user.password ||= SecureRandom.urlsafe_base64(n=6)
			user.password_confirmation ||= user.password
			user.save!
			end
		end
		user
	end


	def self.share_dish(user_id, user_url)
  		user = User.find(user_id)
  		user.facebook.put_connections("me", "mattchefapp:cook", dish: user_url)
	end

	def facebook
	    @facebook ||= Koala::Facebook::API.new(oauth_token)
	    #block_given? this is to prevent errors when permissions 
	    #are lost when a user logs out of fb. railscasts 361
	    block_given? ? yield(@facebook) : @facebook
	    rescue Koala::Facebook::APIError => e
	    logger.info e.to_s
	    nil
 	end

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
	end

  		private
    		def create_remember_token
      			self.remember_token = User.encrypt(User.new_remember_token)
		    end

end
