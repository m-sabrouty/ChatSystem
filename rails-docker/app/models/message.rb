class Message < ApplicationRecord
	belongs_to :chats, class_name: 'Chat', foreign_key: 'chat_id'
end
