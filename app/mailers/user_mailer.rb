class UserMailer < ApplicationMailer
	default from: 'socialmedia@gmail.com'

  def welcome_email(user)
    @user = user
    path = root_url
    @url = "<a href=#{path}>#{path}</a>".html_safe
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def birthday_email(user)
    @user = user
    path = root_url
    @url = "<a href=#{path}>#{path}</a>".html_safe
    mail(to: @user.email, subject: 'Wish you a very happy birthday')
  end

  def login_email(user)
    @user = user
    path = root_url
    @url = "<a href=#{path}>#{path}</a>".html_safe
    mail(to: @user.email, subject: 'New login detect')
  end
end
