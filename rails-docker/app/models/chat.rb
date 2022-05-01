class Chat < ApplicationRecord
	has_many :messages
	belongs_to :applications, class_name: 'Applications', foreign_key: :'application_id'
end
