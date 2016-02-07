class SessionsController < ApplicationController
  	def new
  	end

  	def create
  		user = User.find_by(email: params[:session][:email].downcase)

  		if user && user.authenticate(params[:session][:password])		# authenticate method is provided by has_secure_password
  			log_in user
  			redirect_to user
  		else
  			# Create an error message and display login page
  			flash.now[:danger] = 'Invalid email/password combination'	# using flash.now will cause flash to disappear upon next request
  			render 'new'
  		end
  	end

  	def destroy
  	end
end
