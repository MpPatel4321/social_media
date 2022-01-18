class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :friendships, class_name: "Friendship", dependent: :destroy  
  has_many :friends, class_name: "Friendship", through: :friendships
  has_many :posts
  has_one :like
  has_many :messages

end
