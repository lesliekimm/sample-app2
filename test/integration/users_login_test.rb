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

  	test "login with valid information followed by logout" do
  		get login_path
  		post login_path, session: { email: @user.email, password: 'thumper' }
        assert is_logged_in?                                    # check to see if we're logge din
  		assert_redirected_to @user 								# redirect to user page
  		follow_redirect!										# go to redirect page
  		assert_template 'users/show'							# check it is user's profile page
  		assert_select "a[href=?]", login_path, count: 0         # check presence of certain paths
  		assert_select "a[href=?]", logout_path
  		assert_select "a[href=?]", user_path(@user)
        delete logout_path                                      # log out
        assert_not is_logged_in?                                # check to see that we're logged out
        assert_redirected_to root_url                           # redirect to home page
        delete logout_path                                      # simulate a user clicking logout in a second window
        follow_redirect!                            
        assert_select "a[href=?]", login_path                   # check presence of certain paths
        assert_select "a[href=?]", logout_path, count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
  	end

    test "login with remembering" do
        log_in_as(@user, remember_me: '1')
        assert_equal cookies['remember_token'], assigns(:user).remember_token
    end

    test "login without remembering" do
        log_in_as(@user, remember_me: '0')
        assert_nil cookies['remember_token']
    end
end
