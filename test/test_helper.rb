ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'		# make tests show in red & green
Minitest::Reporters.use!			# section 3.7 - advanced testing setup

class ActiveSupport::TestCase
  	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  	fixtures :all

  	# Add more helper methods to be used by all tests here...

  	# Returns true if a test user is logged in.
  	def is_logged_in?
  		!session[:user_id].nil?
  	end

  	# Logs in a test user.
  	def log_in_as(user, options = {})
  		password = options[:password]	    || 'thumper'
  		remember_me = options[:remember_me]	|| '1'
  		if integration_test?
  			post login_path, session: { email: user.email,
  										password: password,
  										remember_me: remember_me }
  		else
  			session[:user_id] = user.user_id
  		end
  	end

  	private
  		#Returns true inside an integration test.
  		def integration_test?
  			defined?(post_via_redirect)
  		end
end
