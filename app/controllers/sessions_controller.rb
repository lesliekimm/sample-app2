class SessionsController < ApplicationController
  	def new
  	end

  	def create
  		user = User.find_by(email: params[:session][:email].downcase)

  		if user && user.authenticate(params[:session][:password])
        if user.activated?
  			  log_in user 			# log in user
  			  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  			  redirect_back_or user                                      # redirect to page we try to access before logging in
        else
          message = "Account not activated."
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
        end
  		else
  			flash.now[:danger] = 'Invalid email/password combination'  # create an error message - flash.now will ignore future requests
  			render 'new'
  		end
  	end

  	def destroy
  		log_out if logged_in?
  		redirect_to root_url
  	end
end
