class UserMailer < ApplicationMailer
	default from: 'socialmedia@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def birthday_email
    @user = params[:user]
    @url  = 'localhost:3000//users/sign_in'
    mail(to: @user.email, subject: 'Wish you a very happy birthday')
  end
end
