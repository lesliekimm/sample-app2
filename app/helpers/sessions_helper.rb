module SessionsHelper
	# Logs in given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns the current logged-in user (if any).
	# Allows us to make changes to app depending on if user is logged in or not.
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if user is looged in, false otherwise.
  	def logged_in?
    	!current_user.nil?
  	end
end
