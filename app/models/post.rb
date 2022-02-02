class Post < ApplicationRecord
	has_one_attached :avatar, dependent: :destroy
	belongs_to :user
	has_many :likes, as: :likeble, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
end
