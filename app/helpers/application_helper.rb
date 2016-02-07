module ApplicationHelper
	# Returns full title on a per-page basis
	def full_title(page_title = '')								# Method def, optiona arg
		base_title = "Ruby on Rails Tutorial Sample App"		# Variable assignment
		if page_title.empty?									# Boolean test - if no page_title
			base_title											# Implicit return - return value of base_title
		else													# Otherwise
			page_title + " | " + base_title						# Stirng concatenation and return
		end
	end
end
