require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get signup_path													# get signup path
		assert_no_difference 'User.count' do							# check that count doesn't change with invalid submit
			post users_path, user: { name: "",							# post users_path --> calls create action in user controller
									 email: "user@invalid",				# use invalid attributes for submission
									 password: "foo",
									 password_confirmation: "bar" }
		end
		assert_template 'users/new'										# check that failed submission re-renders new action
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: { name: "mowgli",
                                            	  email: "mowgli@lesliekimm.com",
                                            	  password: "auntie",
                                            	  password_confirmation: "auntie" }
		end
		assert_template 'users/show'
		assert is_logged_in?
	end
end
