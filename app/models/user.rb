class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  has_many :friendships, class_name: "Friendship", dependent: :destroy  
  has_many :friends, through: :friendships
  has_many :posts, dependent: :destroy
  has_one :like, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :conversation, through: :friendships

  after_commit :send_mail, on: :create

  def send_mail
    UserMailer.with(user: self).welcome_email.deliver_now
  end

end
