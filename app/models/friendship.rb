class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  has_one :conversation, dependent: :destroy
  has_many :messages, through: :conversation

end
