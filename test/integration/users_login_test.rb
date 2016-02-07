require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:leslie)
	end

  	test "login with invalid information" do
    	get login_path											# get login page
    	assert_template 'sessions/new'							# check to see template is new.html
    	post login_path, session: { email: "", password: "" }	# create session with invalid information
    	assert_template 'sessions/new'							# check to see that template is still new.html
    	assert_not flash.empty?									# check that flash is not empty
    	get root_path											# go to different page
    	assert flash.empty?										# check to see that flash is empty
  	end

  	test "login with valid information" do
  		get login_path
  		post login_path, session: { email: @user.email, password: 'thumper' }
  		assert_redirected_to @user 								# redirect to user page
  		follow_redirect!										# go to redirect page
  		assert_template 'users/show'							# check it is user's profile page
  		assert_select "a[href=?]", login_path, count: 0
  		assert_select "a[href=?]", logout_path
  		assert_select "a[href=?]", user_path(@user)
  	end
end
