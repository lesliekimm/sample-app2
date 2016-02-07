class SessionController < ApplicationController
  	def new
  	end

  	def create
  		user = User.find_by(email: params[:session][:email].downcase)

  		if user && user.authenticate(params[:session][:password])		# authenticate method is provided by has_secure_password
  			# Log the user in and redirect to user's show page
  		else
  			# Create an error message and display login page
  			flash[:danger] = 'Invalid email/password combination'		# not quite right
  			render 'new'
  		end
  	end

  	def destroy
  	end
end
