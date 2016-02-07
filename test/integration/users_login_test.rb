require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  	test "login with invalid information" do
    	get login_path											# get login page
    	assert_template 'sessions/new'							# check to see template is new.html
    	post login_path, session: { email: "", password: "" }	# create session with invalid information
    	assert_template 'sessions/new'							# check to see that template is still new.html
    	assert_not flash.empty?									# check that flash is not empty
    	get root_path											# go to different page
    	assert flash.empty?										# check to see that flash is empty
  	end
end
