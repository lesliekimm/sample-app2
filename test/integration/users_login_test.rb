require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	test "login with invalid information" do
		get login_path											# get login path
		assert_template 'sessions/new'							# make sure it renders properly
		post login_path, session: { email: "", password: "" }	# post to sessions path with invalid params hash
		assert_template 'sessions/new'							# make sure login renders again
		assert_not flash.empty?									# check to make sure flash is not empty - displays error message
		get root_path											# go to a different page
		assert flash.empty?										# check to make sure flash is empty
	end
end
