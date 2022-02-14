class DobJob < ApplicationJob
  queue_as :default

  def perform
    # users = User.where("strftime('%m-%d', dob) = ?" , Date.today.strftime("%m-%d"))
    users = User.first
    # users.each do |user|
      UserMailer.with(user: users).birthday_email.deliver_later
    # end
  end
end