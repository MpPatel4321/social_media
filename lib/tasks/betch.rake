namespace :betch do
  desc "Send out batch messages"
  task send_birthday_wishesh: :environment do
    users = User.where("strftime('%m-%d', dob) = ?" , Date.today.strftime("%m-%d"))
    users.each do |user|
      UserMailer.birthday_email(user).deliver_later
    end
  end

end
