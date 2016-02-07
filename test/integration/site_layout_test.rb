require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "layout links" do									# test layout links by checking HTML structure of our site
		get root_path										# get root path (home page)
		assert_template 'static_pages/home'					# check we're using the right template
		assert_select "a[href=?]", root_path, count: 2		# check there are two links that go to root path
		assert_select "a[href=?]", help_path				# check there is one link to help path
		assert_select "a[href=?]", about_path				# check there is one link to about path
		assert_select "a[href=?]", contact_path				# check there is one link to contact path
		assert_select "a[href=?]", signup_path				# check there is one link to signup path
	end
end
