class UsersController < ApplicationController
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
            # Handle a successful update
        else
            render 'edit'
        end
    end

  	private
  		def user_params
  			params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		end
end
