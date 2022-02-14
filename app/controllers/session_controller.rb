class Devise::SessionsController < Devise::SessionsController

	def create
		super
		UserMailer.login_email(current_user).deliver_now

end