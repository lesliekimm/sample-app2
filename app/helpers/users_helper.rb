module UsersHelper
	# Returns the Gravatar for the given user.
	def gravatar_for(user, options = { size: 100 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)						# create an id using MD5 hash of email address
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"	# create gravatar URL
		image_tag(gravatar_url, alt: user.name, class: "gravatar")						# return image_tag
	end
end
