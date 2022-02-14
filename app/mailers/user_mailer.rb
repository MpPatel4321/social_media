class UserMailer < ApplicationMailer
	default from: 'socialmedia@gmail.com'

  def welcome_email(user)
    @user = user
    url  = root_url
    @url = "<a href='#{url}'>#{url}</a>".html_safe
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def birthday_email
    @user = params[:user]
    url  = root_url
    @url = "<a href='#{url}'>#{url}</a>".html_safe
    mail(to: @user.email, subject: 'Wish you a very happy birthday')
  end

  def login_email(user)
    @user = user
    url  = edit_user_registration_url(@user)
    @url = "<a href='#{url}'>#{url}</a>".html_safe
    mail(to: @user.email, subject: 'Log-in Succesfull')
  end
end
