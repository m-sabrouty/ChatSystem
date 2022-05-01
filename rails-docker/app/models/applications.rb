class Applications < ApplicationRecord
	has_many :chats
	before_create :generate_token
	
  	def generate_token
    	self.token = loop do
	    random_token = SecureRandom.urlsafe_base64(nil, false)
	    break random_token unless Applications.exists?(token: random_token)
    end
  end
end
