module UsersHelper
	# Returns the Gravatar for the given user.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)			# create an id using MD5 hash of email address
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"	# create gravatar URL
		image_tag(gravatar_url, alt: user.name, class: "gravatar")			# return image_tag
	end
end
