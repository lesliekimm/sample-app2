class UsersController < ApplicationController
  	def new
  		@user = User.new					# signup route calls this action
  	end

  	def create
  	end

  	def show
  		@user = User.find(params[:id])		# technically, params[:id] returns a string but find knows to convert to int
  		# debugger
  	end
end
