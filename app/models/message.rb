class Message < ApplicationRecord
	belongs_to :user
	belongs_to :conversation
	
	validates_presence_of :content

	after_create_commit { broadcast_append_to "messages" }
end
