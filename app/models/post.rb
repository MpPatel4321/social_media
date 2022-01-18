class Post < ApplicationRecord
	has_one_attached :avatar
	belongs_to :user
	has_many :likes
	has_many :comments
end
