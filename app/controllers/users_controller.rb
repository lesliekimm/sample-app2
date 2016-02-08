class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]

  	def new
  		@user = User.new					# signup route calls this action
  	end

  	def create
  		@user = User.new(user_params)		# use aux method defined in private to require user and permit only name, email & pws
  		if @user.save
        log_in @user
  			flash[:success] = "Welcome to the Sample App!"
  			redirect_to @user 				# same as redirect_to user_url(@user) - performs show action
  		else
  			render 'new'					# if save is unsuccessful, we render 'new' with errors
  		end
  	end

  	def show
  		@user = User.find(params[:id])		# technically, params[:id] returns a string but find knows to convert to int
  		# debugger
  	end

    def edit
        @user = User.find(params[:id])      # get user we want to edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

  	private
  		def user_params
  			params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		end

        # Before filters

        # Confirm a logged in user
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end

        # Confirms the correct user
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
end
