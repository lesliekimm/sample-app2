class SessionsController < ApplicationController
  	def new
  	end

  	def create
  		user = User.find_by(email: params[:session][:email].downcase)

  		if user && user.authenticate(params[:session][:password])
  			log_in user 			# log in user
  			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  			redirect_to user 		# redirect to show user page
  		else
  			flash.now[:danger] = 'Invalid email/password combination'	# create an error message - flash.now will ignore future requests
  			render 'new'
  		end
  	end

  	def destroy
  		log_out if logged_in?
  		redirect_to root_url
  	end
end
