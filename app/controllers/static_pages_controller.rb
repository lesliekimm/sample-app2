class StaticPagesController < ApplicationController
  def home			# by generating this action, we get the home page for route /static_pages/home
  	@micropost = current_user.microposts.build if logged_in?
  end

  def about
  end

  def contact
  end

  def help
  end
end
