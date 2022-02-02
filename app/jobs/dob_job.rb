class DobJob < ApplicationJob
  queue_as :default
  # sidekiq_options retry: 5

  def perform
    users = User.where("strftime('%m-%d', dob) = ?" , Date.today.strftime("%m-%d"))
    users.each do |user|
      UserMailer.birthday_email(user).deliver_later
    end
  end
end