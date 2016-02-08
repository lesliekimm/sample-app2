class AddIndexToUsersEmail < ActiveRecord::Migration
	 def change
  		add_index :users, :email, unique: true 				# uses method add_index to add index on email column in users talbe
  	end
end
