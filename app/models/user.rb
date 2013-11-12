class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	default_scope -> { order('created_at DESC') }	

	has_many :dishes, dependent: :destroy

	has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true
  	validates :city, presence: true

	has_secure_password

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
