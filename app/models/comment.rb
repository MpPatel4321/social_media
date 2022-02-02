class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :likes, as: :likeble, dependent: :destroy
	validates_presence_of :content
end
